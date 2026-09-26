import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/todo_list/task_provider.dart';

class TodayTask extends StatelessWidget {
  const TodayTask({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();

    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Icon(
                Icons.checklist,
                size: width * (35 / 96),
                color: Colors.green,
              ),
            ),

            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Today's Tasks",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: width * (13 / 96),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '${taskProvider.donetodaytask()} / ${taskProvider.totaltodaytask()}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * (18 / 96),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}