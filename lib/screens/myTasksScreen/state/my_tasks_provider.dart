import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/constants/preferences_manager.dart';

import '../../../constants/constant.dart' show Constant;
import '../../../models/task_model.dart' show TaskModel;

class MyTasksProvider extends ChangeNotifier {
  List<TaskModel> items = [];
  void getLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> strItems = prefs.getStringList(Constant.userTasks) ?? [];
    items = strItems.map((e) => TaskModel.fromJson(jsonDecode(e))).toList();
    notifyListeners();
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
}
