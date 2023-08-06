import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_cats_and_dogs/presentation/pets_list_screen.dart';
import 'package:redux_cats_and_dogs/redux/middleware/pets_middleware.dart';
import 'package:redux_cats_and_dogs/redux/reducers/pets_reducers.dart';
import 'package:redux_cats_and_dogs/redux/state/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
     title: 'Flutter Redux',
     theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       useMaterial3: true,
     ),
     home: const PetsListPage(),
      );
  }
}
