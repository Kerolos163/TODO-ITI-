import 'package:flutter/material.dart';
import 'package:to_do/constants/constant.dart';
import 'package:to_do/constants/preferences_manager.dart';

class UserDetailsProvider extends ChangeNotifier {
  late TextEditingController nameController;
  late TextEditingController quoteController;

  void init() {
    nameController = TextEditingController();
    quoteController = TextEditingController();
    nameController.text = PreferencesManager.getString(Constant.nameKey) ?? "";
    quoteController.text =
        PreferencesManager.getString(Constant.quoteKey) ??
        "One task at a time. One step closer.";
    notifyListeners();
  }

  Future<void> saveUserInfo() async {
    await PreferencesManager.setString(
      Constant.nameKey,
      nameController.text.trim(),
    );
    await PreferencesManager.setString(
      Constant.quoteKey,
      quoteController.text.trim(),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    quoteController.dispose();
    super.dispose();
  }
}
