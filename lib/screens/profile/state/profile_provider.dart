import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../../constants/constant.dart';
import '../../../constants/preferences_manager.dart';

class ProfileProvider extends ChangeNotifier {
  String? profileImage;
  String? name;
  String? quote;

  Future<void> getInfo() async {
    profileImage = PreferencesManager.getString(Constant.userImage);
    name = PreferencesManager.getString(Constant.nameKey);
    quote = PreferencesManager.getString(Constant.quoteKey);
    log('quote: $quote');
    notifyListeners();
  }

  void saveImage(XFile file) async {
    final appDir = await getApplicationDocumentsDirectory();
    final newFile = await File(file.path).copy('${appDir.path}/${file.name}');
    profileImage = newFile.path;
    PreferencesManager.setString(Constant.userImage, newFile.path);
    notifyListeners();
  }
}
