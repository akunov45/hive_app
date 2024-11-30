import 'package:hive/hive.dart';

part 'todos.g.dart';

@HiveType(typeId: 3)
class Todos {
  @HiveField(0)
  int? startTimeHour;
  @HiveField(1)
  int? startTimeMinute;
  @HiveField(2)
  int? endTimeHour;
  @HiveField(3)
  int? endTimeMinute;
  @HiveField(4)
  String name;
  @HiveField(5)
  int color;

  Todos({
    required this.startTimeHour,
    required this.startTimeMinute,
    required this.endTimeHour,
    required this.endTimeMinute,
    required this.name,
    required this.color,
  });
}
