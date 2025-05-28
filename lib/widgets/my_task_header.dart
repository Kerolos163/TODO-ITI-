import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/constants/assets.dart';

class MyTaskHeader extends StatelessWidget {
  const MyTaskHeader({super.key});

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
                  "Good Evening ,Usama ",
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
        SvgPicture.asset(Assets.assetsImgsLight),
      ],
    );
  }
}
