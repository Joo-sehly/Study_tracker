import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task_tracker/todo_list/task_model.dart';
import 'package:task_tracker/todo_list/task_provider.dart';


class TaskSlidable
    extends StatelessWidget {
  final Widget child;
  final TaskModel task;
  final TaskProvider taskProvider;

  const TaskSlidable({
    super.key,
    required this.child,
    required this.task,
    required this.taskProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane:
          taskProvider.isPastDay()
          ? null
          : ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    taskProvider
                        .deleteTask(
                          task,
                        );
                  },
                  backgroundColor:
                      Colors.red,
                  foregroundColor:
                      Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
      child: child,
    );
  }
}
