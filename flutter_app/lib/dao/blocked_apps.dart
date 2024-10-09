import 'package:isar/isar.dart';

import 'package:flutter_app/models/blocked_apps.dart';

class BlockedAppDao {
  final Isar _isar;

  BlockedAppDao(this._isar);

  // Retrieve all blockedApps
  Future<List<BlockedApp>> getAllBlockedApps() async {
    return await _isar.blockedApps.where().findAll();
  }

  // Add a blockedApp
  Future<void> addBlockedApp(BlockedApp blockedApp) async {
    await _isar.writeTxn(() async {
      await _isar.blockedApps.put(blockedApp);
    });
  }

  // Update a blockedApp
  Future<void> updateBlockedApp(BlockedApp blockedApp) async {
    await _isar.writeTxn(() async {
      await _isar.blockedApps.put(blockedApp);
    });
  }

  // Delete a blockedApp
  Future<void> deleteBlockedApp(int id) async {
    await _isar.writeTxn(() async {
      await _isar.blockedApps.delete(id);
    });
  }
}