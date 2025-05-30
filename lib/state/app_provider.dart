import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool darkMode = false;

  void changeMode(bool value) {
    darkMode = value;
    notifyListeners();
  }
}
