import 'package:flutter/material.dart';
import 'package:to_do/models/task_model.dart';

class TaskBuilder extends StatelessWidget {
  const TaskBuilder({super.key, required this.items});
  final List<TaskModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Text(
          items[index].taskName,
          style: Theme.of(context).textTheme.bodyLarge,
        );
      },
      itemCount: items.length,
    );
  }
}
