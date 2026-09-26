import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/todo_list/task_provider.dart';

// import '../providers/task_provider.dart';

class TaskItem extends StatelessWidget {
  final int index;

  const TaskItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final taskProvider = context
        .watch<TaskProvider>();
    final task =
        taskProvider.tasks[index];

    return ListTile(
      leading: Checkbox(
        value: task.isDone,
        onChanged:
            taskProvider.isPastDay()
            ? null
            : (value) {
                taskProvider.toggleTask(
                  task,
                );
              },
      ),

      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isDone
              ? TextDecoration
                    .lineThrough
              : TextDecoration.none,
        ),
      ),

      trailing: IconButton(
        onPressed: () {
          taskProvider.deleteTask(task);
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
