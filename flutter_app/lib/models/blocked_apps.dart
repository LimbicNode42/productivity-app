import 'package:isar/isar.dart';

part 'blocked_apps.g.dart';

@Collection()
class BlockedApp {
  Id id = Isar.autoIncrement; // auto-incremented ID
  late String name;
  late String packageName;
}