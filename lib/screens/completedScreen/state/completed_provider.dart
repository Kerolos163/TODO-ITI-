import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../constants/constant.dart';
import '../../../constants/preferences_manager.dart';
import '../../../models/task_model.dart';

class CompletedProvider extends ChangeNotifier {
  late List<TaskModel>? completedItem = [];
  Future<void> getCompletedTasks() async {
    final List<TaskModel> items =
        PreferencesManager.getStringList(
          Constant.userTasks,
        )?.map((e) => TaskModel.fromJson(jsonDecode(e))).toList() ??
        [];

    completedItem = items.where((e) => e.isCompleted).toList();
    notifyListeners();
  }

  Future<void> updateStateTasks({required int taskID}) async {
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
    getCompletedTasks();
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
    getCompletedTasks();
  }
}
