// main.dart
import 'package:flutter_app/pages/tasks.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/permissions/barrel.dart';
import 'package:flutter_app/models/goals.dart';
import 'package:flutter_app/dao/goals.dart';
import 'package:flutter_app/state_managers/goals.dart';
import 'package:flutter_app/models/tasks.dart';
import 'package:flutter_app/dao/tasks.dart';
import 'package:flutter_app/state_managers/tasks.dart';
import 'package:flutter_app/ui_components/transitions.dart';
import 'package:flutter_app/pages/barrel.dart';

//This function triggers the build process
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([GoalSchema, TaskSchema], directory: dir.path); // Replace GoalSchema with your schema

  // Permission checks
  bool isPermissionGranted = await checkUsageStatsPermission();

  runApp(
    ProviderScope(
      overrides: [
        goalDaoProvider.overrideWithValue(GoalDao(isar)),
        taskDaoProvider.overrideWithValue(TaskDao(isar)),
      ],
      child: MyApp(
        isPermissionGranted: isPermissionGranted
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isPermissionGranted;

  const MyApp({Key? key, required this.isPermissionGranted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home', // HomeScreen
      onGenerateRoute: (RouteSettings settings) {
        // Use the route name to decide which page to show
        switch (settings.name) {
          case '/home':
            return fadeTransition(HomeScreen(isPermissionGranted: isPermissionGranted,));
          case '/goals':
            return fadeTransition(GoalsPage());
          case '/tasks':
            final args = settings.arguments as Map<String, dynamic>;
            return fadeTransition(TasksPage(goalId: args['goalId']));
          default:
            return fadeTransition(HomeScreen(isPermissionGranted: isPermissionGranted,)); // Fallback if route not found
        }
      },
    );
  }
}
