import 'package:isar/isar.dart';

import 'package:flutter_app/models/goals.dart';

class GoalDao {
  final Isar _isar;

  GoalDao(this._isar);

  // Retrieve all goals
  Future<List<Goal>> getAllGoals() async {
    return await _isar.goals.where().findAll();
  }

  // Add a goal
  Future<void> addGoal(Goal goal) async {
    await _isar.writeTxn(() async {
      await _isar.goals.put(goal);
    });
  }

  // Update a goal
  Future<void> updateGoal(Goal goal) async {
    await _isar.writeTxn(() async {
      await _isar.goals.put(goal);
    });
  }

  // Delete a goal
  Future<void> deleteGoal(int id) async {
    await _isar.writeTxn(() async {
      await _isar.goals.delete(id);
    });
  }
}