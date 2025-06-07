import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:to_do/constants/preferences_manager.dart';
import '../constants/assets.dart';
import '../constants/constant.dart';
import 'custom_svg_picture.dart';

class MyTaskHeader extends StatefulWidget {
  const MyTaskHeader({super.key});

  @override
  State<MyTaskHeader> createState() => _MyTaskHeaderState();
}

class _MyTaskHeaderState extends State<MyTaskHeader> {
  String? userName;
  String? userQuote;
  String? userImage;
  @override
  void initState() {
    _getUserName();
    log("Wesso");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userImage != null
                ? CircleAvatar(
                    foregroundImage: FileImage(File(userImage!)),
                    radius: 25,
                  )
                : Image.asset(Assets.assetsImgsImageThumbnail),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Good Evening , $userName",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 2),
                Text(
                  userQuote ?? "One task at a time.One step\n closer.",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: CustomSvgPicture(path: Assets.assetsImgsLight),
        ),
      ],
    );
  }

  void _getUserName() async {
    userName = PreferencesManager.getString(Constant.nameKey);
    userQuote = PreferencesManager.getString(Constant.quoteKey);
    userImage = PreferencesManager.getString(Constant.userImage);
    log(userName ?? "Null");
    setState(() {});
  }
}
