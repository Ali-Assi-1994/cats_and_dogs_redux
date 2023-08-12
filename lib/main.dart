import 'package:flutter/material.dart';
import 'package:redux_cats_and_dogs/presentation/pets_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyApp here');
    return MaterialApp(
      title: 'Flutter Redux',
      theme: ThemeData(primaryColor: Colors.black),
      home: const PetsListPage(),
    );
  }
}
