import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do/constants/preferences_manager.dart';

import '../../../constants/constant.dart';
import '../../../models/task_model.dart';

class AddTasksProvider extends ChangeNotifier {
  bool switchValue = false;
  void changeSwitchValue({required bool newValue}) {
    switchValue = newValue;
    notifyListeners();
  }

  Future<void> storeLocalStorage({
    required String taskName,
    required String description,
    required bool isHighPriority,
  }) async {
    final List<String> items =
        PreferencesManager.getStringList(Constant.userTasks) ?? [];

    TaskModel item = TaskModel(
      id: items.length + 1,
      taskName: taskName,
      description: description,
      isHighPriority: isHighPriority,
    );
    items.add(jsonEncode(item.toJson()));
    log('items: $items');
    await PreferencesManager.setStringList(Constant.userTasks, items);
  }
}
