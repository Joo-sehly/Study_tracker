import 'package:flutter/material.dart';
import 'package:task_tracker/todo_list/task_provider.dart';
import 'package:provider/provider.dart';

class AddTaskDialog
    extends StatefulWidget {
  final int? index;
  final TaskProvider? taskProvider;

  const AddTaskDialog({
    super.key,
    this.index,
    this.taskProvider,
  });

  @override
  State<AddTaskDialog> createState() =>
      _AddTaskDialogState();
}

class _AddTaskDialogState
    extends State<AddTaskDialog> {
  final TextEditingController
  controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.index != null) {
      controller.text = widget
          .taskProvider!
          .tasks[widget.index!]
          .title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Task'),

      content: TextField(
        autofocus: true,
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter task name',
        ),
      ),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),

        ElevatedButton(
          onPressed: () {
            context
                .read<TaskProvider>()
                .add(controller.text);
            Navigator.pop(context);
          },
          child: Text('Submit'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
