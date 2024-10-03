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
}