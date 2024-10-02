import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/models/goals.dart';
import 'package:flutter_app/dao/goals.dart';

// Assuming Isar instance is created somewhere globally
final goalDaoProvider = Provider<GoalDao>((ref) {
  // Throw an error to indicate that this provider should be overridden in the ProviderScope
  throw UnimplementedError('goalDaoProvider should be overridden in main() with the correct Isar instance.');
});

// A StateNotifierProvider to handle the list of goals
final goalsProvider = FutureProvider<List<Goal>>((ref) async {
  final goalRepo = ref.read(goalDaoProvider);
  return await goalRepo.getAllGoals();
});

final goalNotifierProvider = StateNotifierProvider<GoalNotifier, List<Goal>>((ref) {
  final goalDao = ref.read(goalDaoProvider);
  return GoalNotifier(goalDao);
});

class GoalNotifier extends StateNotifier<List<Goal>> {
  final GoalDao goalDao;
  bool isLoading = true; // Add loading state

  GoalNotifier(this.goalDao) : super([]) {
    loadGoals();
  }

  Future<void> loadGoals() async {
    isLoading = true; // Set loading state to true
    final goals = await goalDao.getAllGoals();
    state = goals;
    isLoading = false; // Set loading state to false
  }

  Future<void> addGoal(Goal goal) async {
    await goalDao.addGoal(goal);
    state = [...state, goal]; // Update state with new goal
  }

  Future<void> updateGoal(Goal goal) async {
    await goalDao.updateGoal(goal);
    state = [
      for (final g in state)
        if (g.id == goal.id) goal else g
    ];
  }

  Future<void> deleteGoal(int id) async {
    await goalDao.deleteGoal(id);
    state = state.where((goal) => goal.id != id).toList();
  }
}