import 'package:flutter/material.dart';
import 'package:to_do/models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.item});
  final TaskModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0XFF282828),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.taskName,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  item.description != ""
                      ? Text(
                          item.description!,
                          style: Theme.of(context).textTheme.labelMedium,
                        )
                      : SizedBox(),
                ],
              ),
            ],
          ),
          Icon(Icons.more_vert, color: Color(0XFFC6C6C6)),
        ],
      ),
      // child: ListTile(
      //   contentPadding: EdgeInsets.only(right: 16,left: 8),

      //   leading: Checkbox(value: true, onChanged: (value) {},),
      //   trailing: Icon(Icons.more_vert, color: Color(0XFFC6C6C6)),
      //   title: Text(item.taskName),
      //   titleTextStyle: Theme.of(context).textTheme.bodyMedium,
      //   subtitle: Text(item.taskName),
      //   subtitleTextStyle: Theme.of(context).textTheme.bodyMedium,
      // ),
    );
  }
}
