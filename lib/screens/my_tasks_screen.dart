import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do/constants/assets.dart';

import 'package:to_do/widgets/my_task_header.dart';

class MyTasksScreen extends StatelessWidget {
  const MyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 40,
        child: FloatingActionButton.extended(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(50),
          ),
          backgroundColor: Color(0xFF15B86C),
          label: Row(
            children: [
              SvgPicture.asset(Assets.assetsImgsIcon),
              SizedBox(width: 8),
              Text(
                'Add New Task',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTaskHeader(),
              SizedBox(height: 16),
              Text(
                "Yuhuu ,Your work Is ",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontSize: 32),
              ),
              Row(
                children: [
                  Text(
                    "almost done ! ",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(fontSize: 32),
                  ),
                  SvgPicture.asset(Assets.assetsImgsWavingHand),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
