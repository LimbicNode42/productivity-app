import 'package:isar/isar.dart';

part 'task_history.g.dart';

@Collection()
class TaskHistory {
  Id id = Isar.autoIncrement; // Auto-incremented ID
  late int finalValue; // The value of the task before it was reset
  late DateTime dateRecorded; // The date this value was recorded

  @Index()
  late int taskId; // Links to the Task
}