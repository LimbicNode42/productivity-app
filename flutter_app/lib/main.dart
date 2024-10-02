// main.dart
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/models/goals.dart';
import 'package:flutter_app/dao/goals.dart';
import 'package:flutter_app/state_managers/goals.dart';
import 'package:flutter_app/ui_components/transitions.dart';
import 'package:flutter_app/pages/barrel.dart';

//This function triggers the build process
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([GoalSchema], directory: dir.path); // Replace GoalSchema with your schema

  runApp(
    ProviderScope(
      overrides: [
        goalDaoProvider.overrideWithValue(GoalDao(isar)),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
            return fadeTransition(GoalsPage());
          default:
            return fadeTransition(HomeScreen()); // Fallback if route not found
        }
      },
    );
  }
}
