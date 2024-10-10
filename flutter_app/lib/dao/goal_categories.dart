import 'package:isar/isar.dart';

import 'package:flutter_app/models/goal_categories.dart';

class GoalCategoryDao {
  final Isar _isar;

  GoalCategoryDao(this._isar);

  // Retrieve all goals
  Future<List<GoalCategory>> getAllGoalCategories() async {
    return await _isar.goalCategorys.where().findAll();
  }

  // Add a goal
  Future<void> addGoal(GoalCategory goalCategory) async {
    await _isar.writeTxn(() async {
      await _isar.goalCategorys.put(goalCategory);
    });
  }

  // Update a goal
  Future<void> updateGoal(GoalCategory goalCategory) async {
    await _isar.writeTxn(() async {
      await _isar.goalCategorys.put(goalCategory);
    });
  }

  // Delete a goal
  Future<void> deleteGoalCategory(int id) async {
    await _isar.writeTxn(() async {
      await _isar.goalCategorys.delete(id);
    });
  }
}