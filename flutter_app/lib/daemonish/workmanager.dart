import 'package:flutter_app/state_managers/tasks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workmanager/workmanager.dart';

void scheduleDailyTaskAtMidnight() {
  DateTime now = DateTime.now();
  DateTime nextMidnight = DateTime(now.year, now.month, now.day + 1); // 12:00 AM the next day
  Duration initialDelay = nextMidnight.difference(now);

  Workmanager().registerPeriodicTask(
    "dailyMidnightTask",
    "backgroundTask",
    initialDelay: initialDelay,
    frequency: Duration(days: 1), // Repeat every 24 hours
  );
}

void workmanagerDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final providerContainer = ProviderContainer();

    // Get an instance of TaskNotifier without goalId (all tasks)
    final taskNotifier = providerContainer.read(taskNotifierProvider(null).notifier);

    // Access the task list
    final taskList = providerContainer.read(taskNotifierProvider(null));

    // Loop through each task and perform reset tracking
    for (var task in taskList) {
      await taskNotifier.resetTaskTracking(task);
    }

    return Future.value(true);
  });
}