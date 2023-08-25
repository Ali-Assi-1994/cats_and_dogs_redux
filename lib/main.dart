import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_cats_and_dogs/features/auth/presentation/login_screen.dart';
import 'package:redux_cats_and_dogs/features/auth/presentation/signup_screen.dart';
import 'package:redux_cats_and_dogs/features/pets/application/middlewares/pets_middleware.dart';
import 'package:redux_cats_and_dogs/features/home/presentation/home_page.dart';
import 'package:redux_cats_and_dogs/redux/reducers/app_reducer.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Store(
      appReducer,
      initialState: const AppState.empty(),
      middleware: [loadPetsMiddleware],
    );
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux',
        theme: ThemeData(primaryColor: Colors.black),
        home: FirebaseAuth.instance.currentUser == null ? const LoginScreen() : const HomePage(),
        routes: {
          'login': (context) => const LoginScreen(),
          'signup': (context) => const SignupScreen(),
          'home': (context) => const HomePage(),
        },
      ),
    );
  }
}
