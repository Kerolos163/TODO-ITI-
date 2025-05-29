import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/widgets/task_item.dart';

import '../constants/constant.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  late List<TaskModel>? toDoItem = [];
  @override
  void initState() {
    _getToDoTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To Do Tasks")),
      body: toDoItem == null
          ? CircularProgressIndicator()
          : ListView.separated(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => TaskItem(
                item: toDoItem![index],
                onChanged: (value) {
                  _updateStateTasks(taskID: toDoItem![index].id);
                },
              ),
              separatorBuilder: (context, index) => SizedBox(height: 8),
              itemCount: toDoItem!.length,
            ),
    );
  }

  Future<void> _getToDoTasks() async {
    log("CompletedScreen");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<TaskModel> items =
        prefs
            .getStringList(Constant.userTasks)
            ?.map((e) => TaskModel.fromJson(jsonDecode(e)))
            .toList() ??
        [];

    toDoItem = items.where((e) => e.isCompleted).toList();
    setState(() {});
  }

  Future<void> _updateStateTasks({required int taskID}) async {
    log("CompletedScreen");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<TaskModel> items =
        prefs
            .getStringList(Constant.userTasks)
            ?.map((e) => TaskModel.fromJson(jsonDecode(e)))
            .toList() ??
        [];
    for (var i in items) {
      if (i.id == taskID) {
        i.isCompleted = !i.isCompleted;
        break;
      }
    }

    List<String> strList = items.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(Constant.userTasks, strList);
    _getToDoTasks();
  }
}
