import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task_model.dart';

import '../../state/my_tasks_provider.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.item});
  final TaskModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Consumer<MyTasksProvider>(
                  builder: (context, myTasksProvider, child) {
                    return Checkbox(
                      value: item.isCompleted,
                      onChanged: (value) async {
                        if (value != null) {
                          await myTasksProvider.updateTaskState(
                            id: item.id,
                            isSelected: value,
                          );
                        }
                      },
                    );
                  },
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.taskName,
                        style: item.isCompleted
                            ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Theme.of(
                                  context,
                                ).colorScheme.onSurface,
                                decorationThickness: 1.5,
                              )
                            : Theme.of(context).textTheme.bodyMedium,
                      ),
                      item.description != ""
                          ? Text(
                              item.description!,
                              style: item.isCompleted
                                  ? Theme.of(
                                      context,
                                    ).textTheme.labelMedium?.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Theme.of(
                                        context,
                                      ).colorScheme.secondary,
                                      decorationThickness: 1.5,
                                    )
                                  : Theme.of(context).textTheme.labelMedium,
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.more_vert, color: Theme.of(context).colorScheme.onSurface),
        ],
      ),
    );
  }
}
