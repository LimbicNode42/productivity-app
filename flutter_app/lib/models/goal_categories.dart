import 'package:isar/isar.dart';

part 'goal_categories.g.dart';

@Collection()
class GoalCategory {
  Id id = Isar.autoIncrement; // auto-incremented ID
  late String title;
}