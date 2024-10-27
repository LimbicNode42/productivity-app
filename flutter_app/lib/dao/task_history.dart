import 'package:isar/isar.dart';

import 'package:flutter_app/models/task_history.dart';

class TaskHistoryDao {
  final Isar _isar;

  TaskHistoryDao(this._isar);

  // Retrieve all tasks
  Future<List<TaskHistory>> getAllTaskHistory() async {
    return await _isar.taskHistorys.where().findAll();
  }

  // Retrieve all tasks for specific goal
  Future<List<TaskHistory>> getAllTaskHistoryForTask(int taskId) async {
    return await _isar.taskHistorys.filter().taskIdEqualTo(taskId).findAll();
  }

  // Add a task
  Future<void> addTaskHistory(TaskHistory taskHistory) async {
    await _isar.writeTxn(() async {
      await _isar.taskHistorys.put(taskHistory);
    });
  }

  // Update a task
  Future<void> updateTaskHistory(TaskHistory taskHistory) async {
    await _isar.writeTxn(() async {
      await _isar.taskHistorys.put(taskHistory);
    });
  }

  // Delete a task
  Future<void> deleteTaskHistory(int id) async {
    await _isar.writeTxn(() async {
      await _isar.taskHistorys.delete(id);
    });
  }
}