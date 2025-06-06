import 'package:flutter/material.dart';
import '../constants/constant.dart';
import '../constants/preferences_manager.dart';

class AppProvider extends ChangeNotifier {
  bool darkMode = false;

  void getTheme() async {
    darkMode = PreferencesManager.getBool(Constant.theme) ?? false;
  }

  void changeMode(bool value) async {
    darkMode = value;
    await PreferencesManager.setBool(Constant.theme, darkMode);
    notifyListeners();
  }
}
