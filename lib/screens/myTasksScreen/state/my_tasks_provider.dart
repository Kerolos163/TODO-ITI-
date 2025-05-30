import 'dart:convert';

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
}
