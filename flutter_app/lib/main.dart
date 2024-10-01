// main.dart
import 'package:flutter/material.dart';

import 'package:flutter_app/shared/transitions.dart';
import 'package:flutter_app/pages/barrel.dart';

//This function triggers the build process
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home', // HomeScreen
      onGenerateRoute: (RouteSettings settings) {
        // Use the route name to decide which page to show
        switch (settings.name) {
          case '/':
            return fadeTransition(HomeScreen());
          case '/goals':
            return fadeTransition(Goals());
          default:
            return fadeTransition(HomeScreen()); // Fallback if route not found
        }
      },
    );
  }
}
