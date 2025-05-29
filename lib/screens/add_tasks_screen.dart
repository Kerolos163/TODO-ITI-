import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/constants/constant.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/widgets/form_field_with_label.dart';
import 'package:to_do/constants/extensions.dart';

class AddTasksScreen extends StatefulWidget {
  const AddTasksScreen({super.key});

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  late TextEditingController taskNameController;
  late TextEditingController taskDescriptionController;
  final _formKey = GlobalKey<FormState>();
  bool switchValue = false;

  @override
  void initState() {
    taskNameController = TextEditingController();
    taskDescriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    taskNameController.dispose();
    taskDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Task")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton.icon(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await storeLocalStorage();
                  }
                },
                label: Text(
                  'Add Task',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 18),
                ),
                icon: Icon(Icons.add),
              ),
              SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> storeLocalStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> items = prefs.getStringList(Constant.userTasks) ?? [];
    log('items: $items');
    TaskModel item = TaskModel(
      id: items.length + 1,
      taskName: taskNameController.text.trim(),
      description: taskDescriptionController.text.trim(),
      isHighPriority: switchValue,
    );
    items.add(jsonEncode(item.toJson()));
    await prefs.setStringList(Constant.userTasks, items);
    taskNameController.clear();
    taskDescriptionController.clear();
    if (mounted) {
      Navigator.pop(context);
    }
  }
}
