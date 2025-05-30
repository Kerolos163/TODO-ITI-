import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/constants/preferences_manager.dart';

import '../../../constants/constant.dart' show Constant;
import '../../../models/task_model.dart' show TaskModel;

class MyTasksProvider extends ChangeNotifier {
  List<TaskModel> items = [];
  int totalTask = 0;
  int totalDoneTasks = 0;
  double percent = 0;

  void getLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> strItems = prefs.getStringList(Constant.userTasks) ?? [];
    items = strItems.map((e) => TaskModel.fromJson(jsonDecode(e))).toList();
    calculatePercent();
    getHighPriority();
    notifyListeners();
  }

  calculatePercent() {
    totalTask = items.length;
    totalDoneTasks = items.where((e) => e.isCompleted).length;
    percent = totalTask == 0 ? 0 : totalDoneTasks / totalTask;
    log('percent: $percent');
  }

  Future<void> updateTaskState({
    required int id,
    required bool isSelected,
  }) async {
    final List<TaskModel> items =
        PreferencesManager.getStringList(
          Constant.userTasks,
        )?.map((e) => TaskModel.fromJson(jsonDecode(e))).toList() ??
        [];
    for (var i in items) {
      if (i.id == id) {
        i.isCompleted = isSelected;
        log('isSelected: $isSelected');
        notifyListeners();
        break;
      }
    }
    List<String> strList = items.map((e) => jsonEncode(e.toJson())).toList();
    await PreferencesManager.setStringList(Constant.userTasks, strList);
    getLocalData();
  }

  List<TaskModel> highPriorityItems = [];

  void getHighPriority() {
    highPriorityItems = items.where((e) => e.isHighPriority).toList();
    log('highPriorityItems: $highPriorityItems');
    notifyListeners();
  }
}
