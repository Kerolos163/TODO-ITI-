import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/constants/assets.dart';
import 'package:to_do/constants/constant.dart';

class MyTaskHeader extends StatefulWidget {
  const MyTaskHeader({super.key});

  @override
  State<MyTaskHeader> createState() => _MyTaskHeaderState();
}

class _MyTaskHeaderState extends State<MyTaskHeader> {
  String? userName;
  @override
  void initState() {
    _getUserName();
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
            Image.asset(Assets.assetsImgsImageThumbnail),
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
                  "One task at a time.One step\n closer.",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SvgPicture.asset(Assets.assetsImgsLight),
        ),
      ],
    );
  }

  void _getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString(Constant.nameKey);
    log(userName ?? "Null");
    setState(() {});
  }
}
