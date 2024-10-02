import 'package:isar/isar.dart';

part 'goals.g.dart';

@Collection()
class Goal {
  Id id = Isar.autoIncrement; // auto-incremented ID
  late String title;
}