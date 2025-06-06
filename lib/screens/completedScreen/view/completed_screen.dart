import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/completed_provider.dart';
import '../../../widgets/task_item.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CompletedProvider>(
      create: (context) => CompletedProvider()..getCompletedTasks(),
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
                      getData: () => completedProvider.getCompletedTasks(),
                      item: completedProvider.completedItem![index],
                      onChanged: (value) {
                        completedProvider.updateStateTasks(
                          taskID: completedProvider.completedItem![index].id,
                        );
                      },
                      deleteBTN: () {
                        completedProvider.deleteTask(
                          taskID: completedProvider.completedItem![index].id,
                        );
                        Navigator.pop(context);
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
