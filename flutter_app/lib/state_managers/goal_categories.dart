import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/models/goal_categories.dart';
import 'package:flutter_app/dao/goal_categories.dart';

// Assuming Isar instance is created somewhere globally
final goalCategoryDaoProvider = Provider<GoalCategoryDao>((ref) {
  // Throw an error to indicate that this provider should be overridden in the ProviderScope
  throw UnimplementedError('goalCategoryDaoProvider should be overridden in main() with the correct Isar instance.');
});

// A StateNotifierProvider to handle the list of goals
final goalCategoryProvider = FutureProvider<List<GoalCategory>>((ref) async {
  final goalCategoryRepo = ref.read(goalCategoryDaoProvider);
  return await goalCategoryRepo.getAllGoalCategories();
});

final goalCategoryNotifierProvider = StateNotifierProvider<GoalCategoryNotifier, List<GoalCategory>>((ref) {
  final goalCategoryDao = ref.read(goalCategoryDaoProvider);
  return GoalCategoryNotifier(goalCategoryDao);
});

class GoalCategoryNotifier extends StateNotifier<List<GoalCategory>> {
  final GoalCategoryDao goalCategoryDao;
  bool isLoading = true; // Add loading state

  GoalCategoryNotifier(this.goalCategoryDao) : super([]) {
    loadGoalCategories();
  }

  Future<void> loadGoalCategories() async {
    isLoading = true; // Set loading state to true
    final goalCategory = await goalCategoryDao.getAllGoalCategories();
    state = goalCategory;
    isLoading = false; // Set loading state to false
  }

  Future<void> addGoalCategory(GoalCategory goalCategory) async {
    await goalCategoryDao.addGoal(goalCategory);
    state = [...state, goalCategory]; // Update state with new goal
  }

  Future<void> updateGoalCategory(GoalCategory goalCategory) async {
    await goalCategoryDao.updateGoal(goalCategory);
    state = [
      for (final g in state)
        if (g.id == goalCategory.id) goalCategory else g
    ];
  }

  Future<void> deleteGoalCategory(int id) async {
    await goalCategoryDao.deleteGoalCategory(id);
    state = state.where((goalCategory) => goalCategory.id != id).toList();
  }
}