import 'package:isar/isar.dart';

part 'tasks.g.dart';

@Collection()
class Task {
  Id id = Isar.autoIncrement; // Auto-incremented ID for the task
  late String name; // Name of the task
  late String period; // Period of the task (e.g., daily, weekly)
  late int impact; // Impact level of the task (1-10)

  @Index()
  late int goalId; // The ID of the goal this task is associated with
}