import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<TaskModel> items =
        prefs
            .getStringList(Constant.userTasks)
            ?.map((e) => TaskModel.fromJson(jsonDecode(e)))
            .toList() ??
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
    await prefs.setStringList(Constant.userTasks, strList);
    getLocalData();
  }
}
