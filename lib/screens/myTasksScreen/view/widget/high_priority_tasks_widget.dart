import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants/assets.dart';
import '../../state/my_tasks_provider.dart';
import '../../../../widgets/custom_svg_picture.dart';

class HighPriorityTasksWidget extends StatelessWidget {
  const HighPriorityTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyTasksProvider>(
      builder:
          (
            BuildContext context,
            MyTasksProvider myTasksProvider,
            Widget? child,
          ) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'High Priority Tasks',
                            style: TextStyle(
                              color: Color(0xFF15B86C),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              myTasksProvider.highPriorityItems.length > 4
                              ? 4
                              : myTasksProvider.highPriorityItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Checkbox(
                                  value: myTasksProvider
                                      .highPriorityItems[index]
                                      .isCompleted,
                                  onChanged: (value) => myTasksProvider.updateHighPriorityTaskState(
                                      id: myTasksProvider
                                          .highPriorityItems[index]
                                          .id,
                                      isSelected: myTasksProvider
                                          .highPriorityItems[index]
                                          .isCompleted,
                                    ),
                                ),
                                Flexible(
                                  child: Text(
                                    myTasksProvider
                                        .highPriorityItems[index]
                                        .taskName,
                                    style:
                                        myTasksProvider
                                            .highPriorityItems[index]
                                            .isCompleted
                                        ? Theme.of(
                                            context,
                                          ).textTheme.bodyMedium?.copyWith(
                                            color: Color(0XFF6A6A6A),
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor: Color(0XFF6A6A6A),
                                            decorationThickness: 1.5,
                                          )
                                        : Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      // await Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) {
                      //       return HighPriorityScreen();
                      //     },
                      //   ),
                      // );
                      // controller.loadTask();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 56,
                        width: 48,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          shape: BoxShape.circle,
                          border: Border.all(
                            // color: ThemeController.isDark() ? Color(0xFF6E6E6E) : Color(0xFFD1DAD6),
                          ),
                        ),
                        child: CustomSvgPicture(
                          path: Assets.assetsImgsArrowUpRight,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
    );
  }
}
