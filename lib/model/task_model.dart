class TaskModel {
  final int id;
  final String task;
  final String taskDesc;

  TaskModel({required this.id, required this.task, required this.taskDesc});

  // Factory constructor to create a TaskModel from JSON
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      task: json['task'],
      taskDesc: json['task_desc'],
    );
  }

  // Convert a TaskModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'task': task,
      'task_desc': taskDesc,
    };
  }
}
