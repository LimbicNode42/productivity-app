import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/models/blocked_apps.dart';
import 'package:flutter_app/dao/blocked_apps.dart';

// Assuming Isar instance is created somewhere globally
final blockedAppDaoProvider = Provider<BlockedAppDao>((ref) {
  // Throw an error to indicate that this provider should be overridden in the ProviderScope
  throw UnimplementedError('blockedAppDaoProvider should be overridden in main() with the correct Isar instance.');
});

// A StateNotifierProvider to handle the list of blockedApps
final blockedAppsProvider = FutureProvider<List<BlockedApp>>((ref) async {
  final blockedAppRepo = ref.read(blockedAppDaoProvider);
  return await blockedAppRepo.getAllBlockedApps();
});

final blockedAppNotifierProvider = StateNotifierProvider<BlockedAppNotifier, List<BlockedApp>>((ref) {
  final blockedAppDao = ref.read(blockedAppDaoProvider);
  return BlockedAppNotifier(blockedAppDao);
});

class BlockedAppNotifier extends StateNotifier<List<BlockedApp>> {
  final BlockedAppDao blockedAppDao;
  bool isLoading = true; // Add loading state

  BlockedAppNotifier(this.blockedAppDao) : super([]) {
    loadBlockedApps();
  }

  Future<void> loadBlockedApps() async {
    isLoading = true; // Set loading state to true
    final blockedApps = await blockedAppDao.getAllBlockedApps();
    state = blockedApps;
    isLoading = false; // Set loading state to false
  }

  Future<void> addBlockedApp(BlockedApp blockedApp) async {
    await blockedAppDao.addBlockedApp(blockedApp);
    state = [...state, blockedApp]; // Update state with new blockedApp
  }

  Future<void> updateBlockedApp(BlockedApp blockedApp) async {
    await blockedAppDao.updateBlockedApp(blockedApp);
    state = [
      for (final g in state)
        if (g.id == blockedApp.id) blockedApp else g
    ];
  }

  Future<void> deleteBlockedApp(int id) async {
    await blockedAppDao.deleteBlockedApp(id);
    state = state.where((blockedApp) => blockedApp.id != id).toList();
  }

// Method to remove blocked apps by packageName
Future<void> removeBlockedAppsByPackageName(String packageName) async {
  // Find all apps to remove that match the packageName.
  final appsToRemove = state.where((app) => app.packageName == packageName).toList();

  // Iterate over each app and delete it.
  for (var app in appsToRemove) {
    await blockedAppDao.deleteBlockedApp(app.id); // Remove from the database.
  }

  // Update the state to exclude all apps with the matching packageName.
  state = state.where((app) => app.packageName != packageName).toList();
}
}