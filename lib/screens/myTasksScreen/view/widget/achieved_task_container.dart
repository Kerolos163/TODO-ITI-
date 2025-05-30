import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/screens/myTasksScreen/state/my_tasks_provider.dart';

class AchievedTaskContainer extends StatelessWidget {
  const AchievedTaskContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyTasksProvider>(
      builder: (context, myTasksProvider, child) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Achieved Tasks',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${myTasksProvider.totalDoneTasks} Out of ${myTasksProvider.totalTask} Done',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: -pi / 2,
                    child: SizedBox(
                      height: 48,
                      width: 48,
                      child: CircularProgressIndicator(
                        value: myTasksProvider.percent,
                        backgroundColor: Color(0xFF6D6D6D),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF15B86C),
                        ),
                        strokeWidth: 4,
                      ),
                    ),
                  ),
                  Text(
                    "${((myTasksProvider.percent * 100).toInt())}%",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
