import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:to_do/constants/assets.dart';
import 'package:to_do/screens/addTasksScreen/view/add_tasks_screen.dart';
import 'package:to_do/screens/myTasksScreen/view/widget/achieved_task_container.dart';
import 'package:to_do/screens/myTasksScreen/view/widget/high_priority_tasks_widget.dart';

import 'package:to_do/widgets/my_task_header.dart';
import 'package:to_do/screens/myTasksScreen/view/widget/tasks_builder.dart';

import '../../../models/task_model.dart';
import '../state/my_tasks_provider.dart' show MyTasksProvider;

class MyTasksScreen extends StatelessWidget {
  const MyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyTasksProvider>(
      create: (context) => MyTasksProvider()..getLocalData(),
      child: Scaffold(
        floatingActionButton: SizedBox(
          height: 40,
          child: FloatingActionButton.extended(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTasksScreen()),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(50),
            ),
            backgroundColor: Color(0xFF15B86C),
            icon: Icon(Icons.add, color: Colors.white),
            label: Text(
              'Add New Task',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListView(
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
                SizedBox(height: 24),
                AchievedTaskContainer(),
                SizedBox(height: 24),
                HighPriorityTasksWidget(),
                SizedBox(height: 24),
                Selector<MyTasksProvider, List<TaskModel>>(
                  selector: (_, myTasksProvider) => myTasksProvider.items,
                  builder: (context, items, child) {
                    return TaskBuilder(items: items);
                  },
                ),

                // Consumer<MyTasksProvider>(
                //   builder: (context, myTasksProvider, child) {
                //     return TaskBuilder(items: myTasksProvider.items);
                //   },
                // ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
