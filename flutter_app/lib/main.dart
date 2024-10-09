// main.dart
import 'package:flutter_app/dao/blocked_apps.dart';
import 'package:flutter_app/models/blocked_apps.dart';
import 'package:flutter_app/pages/installed_apps.dart';
import 'package:flutter_app/pages/penalties.dart';
import 'package:flutter_app/pages/tasks.dart';
import 'package:flutter_app/state_managers/blocked_apps.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/daemonish/handlers.dart';
import 'package:flutter_app/notifications/config.dart';
import 'package:flutter_app/permissions/barrel.dart';
import 'package:flutter_app/models/goals.dart';
import 'package:flutter_app/dao/goals.dart';
import 'package:flutter_app/state_managers/goals.dart';
import 'package:flutter_app/models/tasks.dart';
import 'package:flutter_app/dao/tasks.dart';
import 'package:flutter_app/state_managers/tasks.dart';
import 'package:flutter_app/ui_components/transitions.dart';
import 'package:flutter_app/pages/barrel.dart';
import 'package:flutter_app/models/blocked_apps.dart';

//This function triggers the build process
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize port for communication between TaskHandler and UI.
  FlutterForegroundTask.initCommunicationPort();

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [
      GoalSchema, 
      TaskSchema, 
      BlockedAppSchema
    ], 
    directory: dir.path
  ); // Replace GoalSchema with your schema

  runApp(
    ProviderScope(
      overrides: [
        goalDaoProvider.overrideWithValue(GoalDao(isar)),
        taskDaoProvider.overrideWithValue(TaskDao(isar)),
        blockedAppDaoProvider.overrideWithValue(BlockedAppDao(isar)),
      ],
      child: MyApp(
        // isPermissionGranted: isPermissionGranted
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Request permissions and initialize the service.
      requestForegroundTaskPermissions();
      initForegroundOptions();
    });

    FlutterForegroundTask.addTaskDataCallback(onReceiveTaskData);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home', // HomeScreen
      onGenerateRoute: (RouteSettings settings) {
        // Use the route name to decide which page to show
        switch (settings.name) {
          case '/home':
            return fadeTransition(HomeScreen());
          case '/goals':
            return fadeTransition(GoalsPage());
          case '/tasks':
            final args = settings.arguments as Map<String, dynamic>;
            return fadeTransition(TasksPage(goalId: args['goalId']));
          case '/penalties':
            return fadeTransition(PenaltiesScreen());
          case '/blocked_apps':
            return fadeTransition(BlockedAppsPage());
          // case '/penalties':
          //   startForegroundService();
          //   return fadeTransition(HomeScreen(usagePermission: true, accessibilityPermission: true));
          case '/test':
            stopForegroundService();
            return fadeTransition(HomeScreen());
          default:
            return fadeTransition(HomeScreen()); // Fallback if route not found
        }
      },
    );
  }

  @override
  void dispose() {
    // Remove a callback to receive data sent from the TaskHandler.
    FlutterForegroundTask.removeTaskDataCallback(onReceiveTaskData);
    super.dispose();
  }
}
