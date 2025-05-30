import 'package:flutter/material.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/widgets/myTasksScreen/task_item.dart';

class TaskBuilder extends StatelessWidget {
  const TaskBuilder({super.key, required this.items});
  final List<TaskModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("My Tasks", style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) =>
              TaskItem(item: items[index]),
          separatorBuilder: (context, index) => SizedBox(height: 8),
          itemCount: items.length,
        ),
      ],
    );
  }
}
