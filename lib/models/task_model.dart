class TaskModel {
  final int id;
  String taskName;
  String? description;
  bool isHighPriority;
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.taskName,
    this.description,
    required this.isHighPriority,
    this.isCompleted = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> map) {
    return TaskModel(
      id: map["id"],
      taskName: map["taskName"],
      description: map["description"],
      isHighPriority: map["isHighPriority"],
      isCompleted: map["isCompleted"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "taskName": taskName,
      "description": description,
      "isHighPriority": isHighPriority,
      "isCompleted": isCompleted,
    };
  }
}
