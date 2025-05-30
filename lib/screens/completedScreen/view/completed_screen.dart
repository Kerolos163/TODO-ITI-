import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/screens/completedScreen/state/completed_provider.dart';
import 'package:to_do/widgets/task_item.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CompletedProvider>(
      create: (context) => CompletedProvider()..getToDoTasks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Completed Tasks"),
          automaticallyImplyLeading: false,
        ),
        body: Consumer<CompletedProvider>(
          builder: (context, completedProvider, child) {
            return completedProvider.completedItem == null
                ? CircularProgressIndicator()
                : ListView.separated(
                    padding: EdgeInsets.all(16),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) => TaskItem(
                      item: completedProvider.completedItem![index],
                      onChanged: (value) {
                        completedProvider.updateStateTasks(
                          taskID: completedProvider.completedItem![index].id,
                        );
                      },
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                    itemCount: completedProvider.completedItem!.length,
                  );
          },
        ),
      ),
    );
  }
}
