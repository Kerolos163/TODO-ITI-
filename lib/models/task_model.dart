class TaskModel {
  final int id;
  final String taskName;
  final String? description;
  final bool isHighPriority;

  TaskModel({
    required this.id,
    required this.taskName,
    this.description,
    required this.isHighPriority,
  });

  factory TaskModel.fromJson(Map<String, dynamic> map) {
    return TaskModel(
      id: map["id"],
      taskName: map["taskName"],
      description: map["description"],
      isHighPriority: map["isHighPriority"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "taskName": taskName,
      "description": description,
      "isHighPriority": isHighPriority,
    };
  }
}
