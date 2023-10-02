import 'dart:ffi';

class TaskModel {
  late String taskId;
  late String taskName;
  late Int dt;

  TaskModel({
    required this.taskId,
    required this.taskName,
    required this.dt,
  });

  static TaskModel formMap(Map<String, dynamic> map) {
    return TaskModel(
      taskId: map['taskId'],
      taskName: map['taskName'],
      dt: map['dt'],
    );
  }
}
