import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/colors/color.dart';
import 'package:task_tracker/todo_list/add_task_dialog.dart';
import 'package:task_tracker/todo_list/task_provider.dart';
import 'package:task_tracker/todo_list/task_slidable.dart';

class ContainerTodoList extends StatelessWidget {
  const ContainerTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider =
        context.watch<TaskProvider>();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(
        horizontal: 4.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.containercolor,
        borderRadius:
            BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.bordercolor,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Todo List',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),

              Spacer(),

              FittedBox(
                fit: BoxFit.scaleDown,
                child: IconButton(
                  onPressed:
                      taskProvider.isPastDay()
                      ? null
                      : () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AddTaskDialog();
                            },
                          );
                        },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30.w,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          ListView.builder(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(),

            itemCount: taskProvider
                .getTasksForSelectedDate()
                .length,

            itemBuilder: (context, index) {
              final task = taskProvider
                  .getTasksForSelectedDate()[index];

              return TaskSlidable(
                task: task,
                taskProvider: taskProvider,

                child: ListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      color: Colors.white,
                      decoration: task.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor:
                          Colors.white,
                    ),
                  ),

                  trailing: Checkbox(
                    value: task.isDone,

                    onChanged:
                        taskProvider.isPastDay()
                        ? null
                        : (value) {
                            taskProvider
                                .toggleTask(
                                  task,
                                );
                          },

                    fillColor:
                        WidgetStateProperty
                            .resolveWith(
                      (states) {
                        if (states.contains(
                          WidgetState.selected,
                        )) {
                          return Colors.green;
                        }

                        return Colors.transparent;
                      },
                    ),

                    checkColor:
                        Colors.white,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}