import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/constants/assets.dart';
import 'package:to_do/constants/constant.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/screens/add_tasks_screen.dart';

import 'package:to_do/widgets/my_task_header.dart';
import 'package:to_do/widgets/tasks_builder.dart';

class MyTasksScreen extends StatefulWidget {
  const MyTasksScreen({super.key});

  @override
  State<MyTasksScreen> createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen> {
  List<TaskModel> items = [];
  @override
  void initState() {
    _getLocalData();
    super.initState();
  }

  void _getLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> strItems = prefs.getStringList(Constant.userTasks) ?? [];
    items = strItems.map((e) => TaskModel.fromJson(jsonDecode(e))).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 18),
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
              SizedBox(height: 24),
              TaskBuilder(items: items),
            ],
          ),
        ),
      ),
    );
  }
}
