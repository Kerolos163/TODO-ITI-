import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do/constants/task_item_action_enum.dart';
import 'package:to_do/models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.item,
    this.onChanged,
    this.deleteBTN,
  });
  final TaskModel item;
  final void Function(bool?)? onChanged;
  final void Function()? deleteBTN;

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
                Checkbox(value: item.isCompleted, onChanged: onChanged),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.taskName,
                        style: item.isCompleted
                            ? Theme.of(context).textTheme.labelMedium?.copyWith(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Theme.of(
                                  context,
                                ).colorScheme.secondary,
                                decorationThickness: 1.5,
                              )
                            : Theme.of(context).textTheme.labelMedium,
                      ),
                      item.description != ""
                          ? Text(
                              item.description!,
                              style: item.isCompleted
                                  ? Theme.of(
                                      context,
                                    ).textTheme.labelMedium?.copyWith(
                                      color: Color(0XFF6A6A6A),
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Color(0XFF6A6A6A),
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
          PopupMenuButton(
            icon: Icon(Icons.more_vert, color: Color(0XFFC6C6C6)),
            onSelected: (value) async {
              log(value.toString());
              switch (value) {
                case TaskItemActionEnum.delete:
                  await _showDialog(context);
                  break;
                default:
              }
            },
            itemBuilder: (context) => TaskItemActionEnum.values.map((e) {
              return PopupMenuItem(value: e, child: Text(e.name));
            }).toList(),
          ),
        ],
      ),
    );
  }

  Future _showDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Task"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: deleteBTN,
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
