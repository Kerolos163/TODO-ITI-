import 'package:flutter/material.dart';
import 'package:to_do/models/task_model.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key, required this.item, this.onChanged});
  final TaskModel item;
  final void Function(bool?)? onChanged;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0XFF282828),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Checkbox(
                  value: widget.item.isCompleted,
                  onChanged: widget.onChanged,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.item.taskName,
                        style: widget.item.isCompleted
                            ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Color(0XFFFFFCFC),
                                decorationThickness: 1.5,
                              )
                            : Theme.of(context).textTheme.bodyMedium,
                      ),
                      widget.item.description != ""
                          ? Text(
                              widget.item.description!,
                              style: widget.item.isCompleted
                                  ? Theme.of(
                                      context,
                                    ).textTheme.labelMedium?.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Color(0XFFC6C6C6),
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
          Icon(Icons.more_vert, color: Color(0XFFC6C6C6)),
        ],
      ),
    );
  }
}
