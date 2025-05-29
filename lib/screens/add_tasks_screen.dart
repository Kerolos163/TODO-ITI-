import 'package:flutter/material.dart';
import 'package:to_do/widgets/form_field_with_label.dart';
import 'package:to_do/constants/extensions.dart';

class AddTasksScreen extends StatefulWidget {
  const AddTasksScreen({super.key});

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  late TextEditingController taskNameController;
  late TextEditingController? taskDescriptionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    taskNameController = TextEditingController();
    taskDescriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    taskNameController.dispose();
    taskDescriptionController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Task")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                title: "Task Name",
                hintText: "Finish UI design for login screen",
                controllerl: taskNameController,
                validator: (value) {
                  if (value.isNullString) {
                    return 'Please enter Task Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                title: "Task Description",
                hintText:
                    "Finish onboarding UI and hand off to devs by Thursday.",
                controllerl: taskDescriptionController,
                maxLines: 5,
              ),
              Spacer(),
              ElevatedButton.icon(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
               
                  }
                },
                label: Text(
                  'Add Task',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 18),
                ),
                icon: Icon(Icons.add),
              ),
              SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
