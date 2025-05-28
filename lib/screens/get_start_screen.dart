import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/constants/assets.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(children: [SvgPicture.asset(Assets.assetsImgsLogo)]),
        ),
      ),
    );
  }
}
