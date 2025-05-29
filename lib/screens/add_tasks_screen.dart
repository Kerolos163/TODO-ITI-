import 'package:flutter/material.dart';

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
            ElevatedButton.icon(
              onPressed: () {},
              label: Text(
                'Add Task',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 18),
              ),
              icon: Icon(Icons.add),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
