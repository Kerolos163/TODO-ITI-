import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/constants/assets.dart';

class AddTasksScreen extends StatelessWidget {
  const AddTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Task")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Task Name", style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 8),
            TextField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintText: 'Finish UI design for login screen',
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Task Description",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 8),
            TextField(
              style: TextStyle(fontSize: 20),
              maxLines: 5,
              decoration: InputDecoration(
                hintText:
                    'Finish onboarding UI and hand off to devs by Thursday.',
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.assetsImgsIcon),
                  SizedBox(width: 8),
                  Text(
                    'Add Task',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
