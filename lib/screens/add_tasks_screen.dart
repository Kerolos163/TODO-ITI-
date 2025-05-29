import 'package:flutter/material.dart';
import 'package:to_do/widgets/form_field_with_label.dart';

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
            CustomTextFormField(
              title: "Task Name",
              hintText: "Finish UI design for login screen",
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              title: "Task Description",
              hintText:
                  "Finish onboarding UI and hand off to devs by Thursday.",
              maxLines: 5,
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
