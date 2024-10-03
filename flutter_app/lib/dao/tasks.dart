import 'package:isar/isar.dart';

import 'package:flutter_app/models/tasks.dart';

class TaskDao {
  final Isar _isar;

  TaskDao(this._isar);

  // Retrieve all tasks
  Future<List<Task>> getAllTasks() async {
    return await _isar.tasks.where().findAll();
  }

  // Retrieve all tasks for specific goal
  Future<List<Task>> getAllTasksForGoal(int goalId) async {
    return await _isar.tasks.filter().goalIdEqualTo(goalId).findAll();
  }

  // Add a task
  Future<void> addTask(Task task) async {
    await _isar.writeTxn(() async {
      await _isar.tasks.put(task);
    });
  }

  // Update a task
  Future<void> updateTask(Task task) async {
    await _isar.writeTxn(() async {
      await _isar.tasks.put(task);
    });
  }

  // Delete a task
  Future<void> deleteTask(int id) async {
    await _isar.writeTxn(() async {
      await _isar.tasks.delete(id);
    });
  }
}