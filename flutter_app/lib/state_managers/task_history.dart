import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/models/task_history.dart';
import 'package:flutter_app/dao/task_history.dart';

// Assuming Isar instance is created somewhere globally
final taskHistoryDaoProvider = Provider<TaskHistoryDao>((ref) {
  // Throw an error to indicate that this provider should be overridden in the ProviderScope
  throw UnimplementedError('taskHistoryDaoProvider should be overridden in main() with the correct Isar instance.');
});

// A FutureProvider to handle the list of tasks for a specific task
final taskHistoryProvider = FutureProvider.family<List<TaskHistory>, int>((ref, taskId) async {
  final taskHistoryRepo = ref.read(taskHistoryDaoProvider);
  return await taskHistoryRepo.getAllTaskHistoryForTask(taskId);
});

final taskHistoryNotifierProvider = StateNotifierProvider.family<TaskHistoryNotifier, List<TaskHistory>, int?>((ref, taskId) {
  final taskHistoryDao = ref.read(taskHistoryDaoProvider);
  return TaskHistoryNotifier(taskHistoryDao, taskId);
});

class TaskHistoryNotifier extends StateNotifier<List<TaskHistory>> {
  final TaskHistoryDao taskHistoryDao;
  bool isLoading = true; // Add loading state
  final int? taskId;

  TaskHistoryNotifier(this.taskHistoryDao, [this.taskId]) : super([]) {
    loadTaskHistory();
  }

  Future<void> loadTaskHistory() async {
    if (taskId != null) {
      isLoading = true; // Set loading state to true
      final taskHistory = await taskHistoryDao.getAllTaskHistoryForTask(taskId!);
      state = taskHistory;
      isLoading = false; // Set loading state to false
    } else {
      isLoading = true; // Set loading state to true
      final taskHistory = await taskHistoryDao.getAllTaskHistory();
      state = taskHistory;
      isLoading = false; // Set loading state to false
    }
  }

  Future<void> addTaskHistory(TaskHistory taskHistory) async {
    await taskHistoryDao.addTaskHistory(taskHistory);
    state = [...state, taskHistory]; // Update state with new task
  }

  Future<void> updateTaskHistory(TaskHistory taskHistory) async {
    await taskHistoryDao.updateTaskHistory(taskHistory);
    state = [
      for (final g in state)
        if (g.id == taskHistory.id) taskHistory else g
    ];
  }

  Future<void> deleteTaskHistory(int id) async {
    await taskHistoryDao.deleteTaskHistory(id);
    state = state.where((taskHistory) => taskHistory.id != id).toList();
  }

  Future<void> deleteTaskHistories(List<TaskHistory> taskHistories) async {
    for (TaskHistory taskHistory in taskHistories) {
      // Delete the task using the DAO
      await taskHistoryDao.deleteTaskHistory(taskHistory.id);
      // Update the state to remove the deleted task
      state = state.where((t) => t.id != taskHistory.id).toList();
    }
  }
}