import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  bool isDone;

  @HiveField(2)
  DateTime? completeAt;

  @HiveField(3)
  DateTime date;
  
  TaskModel({
    required this.title,
    this.isDone = false,
    required this.date,
    this.completeAt,
  });
}
