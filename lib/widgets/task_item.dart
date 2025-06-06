import 'dart:convert';
import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:to_do/constants/constant.dart';
import 'package:to_do/constants/preferences_manager.dart';
import 'package:to_do/state/app_provider.dart';

import '../constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:to_do/constants/task_item_action_enum.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/widgets/form_field_with_label.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.item,
    this.onChanged,
    this.deleteBTN,
    required this.getData,
  });
  final TaskModel item;
  final void Function(bool?)? onChanged;
  final void Function()? deleteBTN;
  final void Function() getData;

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
                case TaskItemActionEnum.edit:
                  bool result = await _showButtonSheet(
                    context,
                    taskModel: item,
                  );
                  if (result) {
                    getData();
                  }
                  break;
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

  Future _showButtonSheet(
    BuildContext context, {
    required TaskModel taskModel,
  }) {
    bool isHighPriority = taskModel.isHighPriority;
    TextEditingController taskNameController = TextEditingController(
      text: taskModel.taskName,
    );
    TextEditingController taskDescriptionController = TextEditingController(
      text: taskModel.description,
    );
    GlobalKey<FormState> globalKey = GlobalKey<FormState>();
    bool newValue = false;
    return showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: globalKey,
              child: StatefulBuilder(
                builder: (context, setState) => Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          CustomTextFormField(
                            title: "Task Name",
                            hintText: "Finish UI design for login screen",
                            controllerl: taskNameController,
                            validator: (value) {
                              if (value.isNullString) {
                                return 'Please enter Task Name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          CustomTextFormField(
                            title: "Task Description",
                            hintText:
                                "Finish onboarding UI and hand off to devs by Thursday.",
                            controllerl: taskDescriptionController,
                            maxLines: 5,
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "High Priority",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Switch(
                                value: isHighPriority,
                                onChanged: (value) {
                                  setState(
                                    () => isHighPriority = !isHighPriority,
                                  );
                                },
                              ), //ToDO:Change Value
                            ],
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.width, 40),
                      ),
                      onPressed: () async {
                        List<TaskModel> items =
                            PreferencesManager.getStringList(Constant.userTasks)
                                ?.map((e) => TaskModel.fromJson(jsonDecode(e)))
                                .toList() ??
                            [];
                        for (var i = 0; i < items.length; i++) {
                          if (items[i].id == taskModel.id) {
                            items[i].taskName = taskNameController.text.trim();
                            items[i].description = taskDescriptionController
                                .text
                                .trim();
                            newValue = true;
                            break;
                          }
                        }
                        List<String> listSTR = items
                            .map((e) => jsonEncode(e.toJson()))
                            .toList();
                        PreferencesManager.setStringList(
                          Constant.userTasks,
                          listSTR,
                        );
                        Navigator.pop(context, newValue);
                      },
                      label: Text(
                        'Edit Task',
                        style: Theme.of(
                          context,
                        ).textTheme.displayMedium?.copyWith(fontSize: 18),
                      ),
                      icon: Consumer<AppProvider>(
                        builder: (context, appProvider, child) {
                          return Icon(
                            Icons.edit,
                            color: appProvider.darkMode
                                ? Color(0xFF161F1B)
                                : Color(0XFFFFFCFC),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
