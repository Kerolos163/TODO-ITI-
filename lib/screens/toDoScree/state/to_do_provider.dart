import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do/constants/constant.dart';
import 'package:to_do/constants/preferences_manager.dart';
import 'package:to_do/models/task_model.dart';

class ToDoProvider extends ChangeNotifier {
  List<TaskModel>? toDoItem = [];
  Future<void> getToDoTasks() async {
    log("ToDOScreen");

    final List<TaskModel> items =
        PreferencesManager.getStringList(
          Constant.userTasks,
        )?.map((e) => TaskModel.fromJson(jsonDecode(e))).toList() ??
        [];

    toDoItem = items.where((e) => !e.isCompleted).toList();
    notifyListeners();
  }

  Future<void> updateStateTasks({required int taskID}) async {
    log("ToDOScreen");

    final List<TaskModel> items =
        PreferencesManager.getStringList(
          Constant.userTasks,
        )?.map((e) => TaskModel.fromJson(jsonDecode(e))).toList() ??
        [];
    for (var i in items) {
      if (i.id == taskID) {
        i.isCompleted = !i.isCompleted;
        break;
      }
    }

    List<String> strList = items.map((e) => jsonEncode(e.toJson())).toList();
    await PreferencesManager.setStringList(Constant.userTasks, strList);
    getToDoTasks();
  }
}
