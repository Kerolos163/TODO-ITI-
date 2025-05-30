import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do/constants/constant.dart';
import 'package:to_do/constants/preferences_manager.dart';

class ProfileProvider extends ChangeNotifier {
  String? profileImage;

  void getImage() async {
    profileImage = PreferencesManager.getString(Constant.userImage);
  }

  void saveImage(XFile file) async {
    final appDir = await getApplicationDocumentsDirectory();
    final newFile = await File(file.path).copy('${appDir.path}/${file.name}');
    profileImage = newFile.path;
    PreferencesManager.setString(Constant.userImage, newFile.path);
    notifyListeners();
  }
}
