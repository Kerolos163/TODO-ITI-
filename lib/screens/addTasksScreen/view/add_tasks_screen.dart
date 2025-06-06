import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/add_tasks_provider.dart';
import '../../layout_screen.dart';
import '../../../state/app_provider.dart';
import '../../../widgets/form_field_with_label.dart';
import '../../../constants/extensions.dart';

class AddTasksScreen extends StatefulWidget {
  const AddTasksScreen({super.key});

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  late TextEditingController taskNameController;
  late TextEditingController taskDescriptionController;
  final _formKey = GlobalKey<FormState>();
  bool switchValue = false;

  @override
  void initState() {
    taskNameController = TextEditingController();
    taskDescriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    taskNameController.dispose();
    taskDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddTasksProvider>(
      create: (context) => AddTasksProvider(),
      child: Scaffold(
        appBar: AppBar(title: Text("New Task")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
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
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "High Priority",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Consumer<AddTasksProvider>(
                            builder: (context, addTasksProvider, child) {
                              return Switch(
                                value: addTasksProvider.switchValue,
                                onChanged: (value) => addTasksProvider
                                    .changeSwitchValue(newValue: value),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Consumer<AddTasksProvider>(
                  builder: (context, addTasksProvider, child) {
                    return ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.width, 40),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await addTasksProvider.storeLocalStorage(
                            taskName: taskNameController.text.trim(),
                            description: taskDescriptionController.text.trim(),
                          );
                          taskNameController.clear();
                          taskDescriptionController.clear();
                          if (context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LayoutScreen(),
                              ),
                            );
                          }
                        }
                      },

                      label: Text(
                        'Add Task',
                        style: Theme.of(
                          context,
                        ).textTheme.displayMedium?.copyWith(fontSize: 18),
                      ),
                      icon: Consumer<AppProvider>(
                        builder: (context, appProvider, child) {
                          return Icon(
                            Icons.add,
                            color: appProvider.darkMode
                                ? Color(0xFF161F1B)
                                : Color(0XFFFFFCFC),
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
