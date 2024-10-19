import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/models/tasks.dart';
import 'package:flutter_app/dao/tasks.dart';

// Assuming Isar instance is created somewhere globally
final taskDaoProvider = Provider<TaskDao>((ref) {
  // Throw an error to indicate that this provider should be overridden in the ProviderScope
  throw UnimplementedError('taskDaoProvider should be overridden in main() with the correct Isar instance.');
});

// A FutureProvider to handle the list of tasks for a specific goal
final tasksProvider = FutureProvider.family<List<Task>, int>((ref, goalId) async {
  final taskRepo = ref.read(taskDaoProvider);
  return await taskRepo.getAllTasksForGoal(goalId);
});

final taskNotifierProvider = StateNotifierProvider.family<TaskNotifier, List<Task>, int>((ref, goalId) {
  final taskDao = ref.read(taskDaoProvider);
  return TaskNotifier(taskDao, goalId);
});

class TaskNotifier extends StateNotifier<List<Task>> {
  final TaskDao taskDao;
  bool isLoading = true; // Add loading state
  final int goalId;

  TaskNotifier(this.taskDao, this.goalId) : super([]) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    isLoading = true; // Set loading state to true
    final tasks = await taskDao.getAllTasksForGoal(goalId);
    state = tasks;
    isLoading = false; // Set loading state to false
  }

  Future<void> addTask(Task task) async {
    await taskDao.addTask(task);
    state = [...state, task]; // Update state with new task
  }

  Future<void> updateTask(Task task) async {
    await taskDao.updateTask(task);
    state = [
      for (final g in state)
        if (g.id == task.id) task else g
    ];
  }

  Future<void> deleteTask(int id) async {
    await taskDao.deleteTask(id);
    state = state.where((task) => task.id != id).toList();
  }

  Future<void> deleteTasks(List<Task> tasks) async {
    for (Task task in tasks) {
      // Delete the task using the DAO
      await taskDao.deleteTask(task.id);
      // Update the state to remove the deleted task
      state = state.where((t) => t.id != task.id).toList();
    }
  }

  Future<void> resetTaskTracking(Task task) async {
    DateTime now = DateTime.now();
    
    // 1. Check if today is one of the selected reset days
    if (task.resetDays != null && !task.resetDays!.contains(now.weekday)) {
      return; // It's not a reset day, so exit the function.
    }

    // 2. Check if the end date has passed
    if (task.endDate != null && now.isAfter(task.endDate!)) {
      Task updatedTask = task..taskTrackingEnabled = 0;
      updateTask(updatedTask);
      return; // End date has passed, stop resetting.
    }

    // 3. Check if the maximum number of resets has been reached
    if (task.maxResets != null && task.resetCount >= task.maxResets!) {
      Task updatedTask = task..taskTrackingEnabled = 0;
      updateTask(updatedTask);
      return; // Maximum resets reached, stop resetting.
    }

    // Calculate the next reset date based on the recurrence period (if using time intervals)
    DateTime nextResetDate = _calculateNextResetDateWithEnd(task)!;
    
    if (now.isAfter(nextResetDate)) {
      // Store the tracked value in TaskHistory for graphing
      // final newHistory = TaskHistory()
      //   ..taskId = task.id
      //   ..finalValue = task.trackedValue
      //   ..dateRecorded = now;

      // Save history to the database
      // await ref.read(taskHistoryDaoProvider).addTaskHistory(newHistory);

      // Reset the tracked value and increment the reset count
      task.trackedValue = 0;
      task.lastReset = now;
      task.resetCount += 1;

      // Save the updated task back to the database
      await updateTask(task);
    }
  }

  DateTime? _calculateNextResetDate(Task task) {
    DateTime now = DateTime.now();
    DateTime lastReset = task.lastReset ?? now;

    switch (task.recurrencePeriod) {
      case 'daily':
        return lastReset.add(Duration(days: task.recurrenceInterval)); // e.g., 1 day or 4 days

      case 'weekly':
        return _calculateNextWeeklyReset(task, lastReset);

      case 'monthly':
        return _calculateNextMonthlyReset(lastReset, task.recurrenceInterval);

      case 'yearly':
        return _calculateNextYearlyReset(lastReset, task.recurrenceInterval);

      default:
        return now; // Default case if no valid recurrencePeriod found
    }
  }

  // Weekly reset helper (handles multiple days like "Tue", "Thu")
  DateTime _calculateNextWeeklyReset(Task task, DateTime lastReset) {
    List<int> resetDays = task.resetDays ?? [];

    int currentWeekday = lastReset.weekday;
    for (int day in resetDays) {
      if (day > currentWeekday) {
        return lastReset.add(Duration(days: day - currentWeekday));
      }
    }

    // If no future reset day found, reset on the first reset day in the next week
    int firstResetDayNextWeek = resetDays.first;
    return lastReset.add(Duration(days: (7 - currentWeekday) + firstResetDayNextWeek));
  }

  // Monthly reset helper
  DateTime _calculateNextMonthlyReset(DateTime lastReset, int interval) {
    int year = lastReset.year;
    int month = lastReset.month + interval; // Add the interval (e.g., 1 month)

    if (month > 12) {
      year += 1;
      month = month % 12;
    }

    int day = lastReset.day;
    int maxDayOfNextMonth = DateTime(year, month + 1, 0).day;
    if (day > maxDayOfNextMonth) {
      day = maxDayOfNextMonth;
    }

    return DateTime(year, month, day);
  }

  // Yearly reset helper
  DateTime _calculateNextYearlyReset(DateTime lastReset, int interval) {
    return DateTime(lastReset.year + interval, lastReset.month, lastReset.day);
  }

  // Stop tracking logic
  DateTime? _calculateNextResetDateWithEnd(Task task) {
    DateTime nextReset = _calculateNextResetDate(task)!;

    // Stop after end date
    if (task.endDate != null && nextReset.isAfter(task.endDate!)) {
      return DateTime.now().add(Duration(days: 1));
    }

    if (task.maxResets != null && task.resetCount >= task.maxResets!) {
      return DateTime.now().add(Duration(days: 1));
    }

    return nextReset;
  }
}