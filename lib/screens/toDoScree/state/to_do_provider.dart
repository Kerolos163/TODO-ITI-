import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../constants/constant.dart';
import '../../../constants/preferences_manager.dart';
import '../../../models/task_model.dart';

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

  void deleteTask({required int taskID}) async {
    final List<TaskModel> items =
        PreferencesManager.getStringList(
          Constant.userTasks,
        )?.map((e) => TaskModel.fromJson(jsonDecode(e))).toList() ??
        [];

    final List<TaskModel> newList = items
        .where((element) => element.id != taskID)
        .toList();
    List<String> strList = newList.map((e) => jsonEncode(e.toJson())).toList();
    await PreferencesManager.setStringList(Constant.userTasks, strList);
    getToDoTasks();
  }
}
