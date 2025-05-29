import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/constants/constant.dart';
import 'package:to_do/models/task_model.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key, required this.item});
  final TaskModel item;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  late bool isSelected;
  @override
  void initState() {
    isSelected = widget.item.isCompleted;
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
          Row(
            children: [
              Checkbox(
                value: isSelected,
                onChanged: (value) async {
                  if (value != null) {
                    setState(() {
                      isSelected = value;
                    });
                    await _updateTaskState();
                  }
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.item.taskName,
                    style: isSelected
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
                          style: isSelected
                              ? Theme.of(
                                  context,
                                ).textTheme.labelMedium?.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Color(0XFFFFFCFC),
                                  decorationThickness: 1.5,
                                )
                              : Theme.of(context).textTheme.labelMedium,
                        )
                      : SizedBox(),
                ],
              ),
            ],
          ),
          Icon(Icons.more_vert, color: Color(0XFFC6C6C6)),
        ],
      ),
    );
  }

  Future<void> _updateTaskState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<TaskModel> items =
        prefs
            .getStringList(Constant.userTasks)
            ?.map((e) => TaskModel.fromJson(jsonDecode(e)))
            .toList() ??
        [];
    for (var i in items) {
      if (i.id == widget.item.id) {
        i.isCompleted = isSelected;
        break;
      }
    }
    List<String> strList = items.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(Constant.userTasks, strList);
  }
}
