import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_cats_and_dogs/presentation/dogs_list_screen.dart';
import 'package:redux_cats_and_dogs/presentation/home_page.dart';
import 'package:redux_cats_and_dogs/redux/middleware/pets_middleware.dart';
import 'package:redux_cats_and_dogs/redux/reducers/pets_reducers.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Store(
      appReducer,
      initialState: AppState.empty(),
      middleware: [loadPetsMiddleware],
    );
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux',
        theme: ThemeData(primaryColor: Colors.black),
        home: const HomePage(),
      ),
    );
  }
}
