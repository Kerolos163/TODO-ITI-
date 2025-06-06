import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/to_do_provider.dart';
import '../../../widgets/task_item.dart';

class ToDOScreen extends StatelessWidget {
  const ToDOScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ToDoProvider>(
      create: (context) => ToDoProvider()..getToDoTasks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("To Do Tasks"),
          automaticallyImplyLeading: false,
        ),
        body: Consumer<ToDoProvider>(
          builder: (context, toDoProvider, child) {
            return toDoProvider.toDoItem == null
                ? CircularProgressIndicator()
                : ListView.separated(
                    padding: EdgeInsets.all(16),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) => TaskItem(
                      getData: () => toDoProvider.getToDoTasks(),
                      item: toDoProvider.toDoItem![index],
                      onChanged: (value) {
                        toDoProvider.updateStateTasks(
                          taskID: toDoProvider.toDoItem![index].id,
                        );
                      },
                      deleteBTN: () {
                        toDoProvider.deleteTask(
                          taskID: toDoProvider.toDoItem![index].id,
                        );
                        Navigator.pop(context);
                      },
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                    itemCount: toDoProvider.toDoItem!.length,
                  );
          },
        ),
      ),
    );
  }
}
