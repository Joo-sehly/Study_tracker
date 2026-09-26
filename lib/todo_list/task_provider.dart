import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_tracker/todo_list/task_model.dart';

class TaskProvider
    extends ChangeNotifier {
  List<TaskModel> tasks = [];

  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime today = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  final box = Hive.box('tasksBox');

  TaskProvider() {
    loadTasks();
  }

  void loadTasks() {
    tasks = box.values
        .cast<TaskModel>()
        .toList();

    notifyListeners();
  }

  List<TaskModel>
  getTasksForSelectedDate() {
    List<TaskModel> selectedTasks = [];

    for (var task in tasks) {
      if (task.date.year ==
              selectedDate.year &&
          task.date.month ==
              selectedDate.month &&
          task.date.day ==
              selectedDate.day) {
        selectedTasks.add(task);
      }
    }

    return selectedTasks;
  }

  void add(String title) {
    // to add task
    final task = TaskModel(
      title: title,
      date: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );

    tasks.add(task);
    box.add(task);

    notifyListeners();
  }

  void previousDay() {
    // to move to previous day
    selectedDate = selectedDate
        .subtract(Duration(days: 1));

    notifyListeners();
  }

  void nextDay() {
    // to move to next day
    if (selectedDate.isBefore(today)) {
      selectedDate = selectedDate.add(
        Duration(days: 1),
      );

      notifyListeners();
    }
  }

  bool isPastDay() {
    // is this day is past or not
    return selectedDate.isBefore(today);
  }

  void toggleTask(TaskModel task) {
    //  change check box
    int index = tasks.indexOf(task);

    task.isDone = !task.isDone;

    if (task.isDone) {
      task.completeAt = DateTime.now();
    } else {
      task.completeAt = null;
    }

    box.putAt(index, task);

    notifyListeners();
  }

  void deleteTask(TaskModel task) {
    // to delete task
    int index = tasks.indexOf(task);

    tasks.removeAt(index);
    box.deleteAt(index);

    notifyListeners();
  }

  int donetodaytask() {
    // check is the task is done or not
    int count = 0;

    for (var task in tasks) {
      if (task.completeAt != null) {
        if (task.completeAt!.year ==
                DateTime.now().year &&
            task.completeAt!.month ==
                DateTime.now().month &&
            task.completeAt!.day ==
                DateTime.now().day) {
          count++;
        }
      }
    }

    return count;
  }

  int totaltodaytask() {
    // to get total task of today
  int count = 0;

  for (var task in tasks) {
    if (task.date.year == today.year &&
        task.date.month == today.month &&
        task.date.day == today.day) {
      count++;
    }
  }

  return count;
}

  int getTasksThisWeek() {
    // to get task of this week
    int daysFromSaturday =
        (today.weekday - 6 +7) % 7;

    DateTime startOfWeek =
        DateTime(
          today.year,
          today.month,
          today.day,
        ).subtract(
          Duration(
            days: daysFromSaturday,
          ),
        );

    int count = 0;

    for (var task in tasks) {
      if (task.isDone &&
          task.completeAt != null &&
          !task.completeAt!.isBefore(
            startOfWeek,
          )) {
        count++;
      }
    }

    return count;
  }

  int getTasksThisMonth() {
    // to get task of this month
    DateTime today = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    DateTime startOfMonth = DateTime(
      today.year,
      today.month,
      1,
    );

    int count = 0;

    for (var task in tasks) {
      if (task.isDone &&
          task.completeAt != null &&
          !task.completeAt!.isBefore(
            startOfMonth,
          )) {
        count++;
      }
    }

    return count;
  }

  int getTasksThisYear() {
    // to get task of this year
    DateTime today = DateTime.now();

    DateTime startOfYear = DateTime(
      today.year,
    );

    int count = 0;

    for (var task in tasks) {
      if (task.isDone &&
          task.completeAt != null &&
          !task.completeAt!.isBefore(
            startOfYear,
          )) {
        count++;
      }
    }

    return count;
  }

  int getCompletedTasksOnDate(DateTime date) {
  int count = 0;

  for (var task in tasks) {
    if (task.isDone &&
        task.completeAt != null &&
        task.completeAt!.year == date.year &&
        task.completeAt!.month == date.month &&
        task.completeAt!.day == date.day) {
      count++;
    }
  }

  return count;
}


int getStreak() {
  int streak = 0;

  DateTime date = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).subtract(
    Duration(days: 1),
  );

  while (true) {
    bool hasTask = false;

    for (var task in tasks) {
      if (task.isDone &&
          task.completeAt != null &&
          task.completeAt!.year == date.year &&
          task.completeAt!.month == date.month &&
          task.completeAt!.day == date.day) {
        hasTask = true;
        break;
      }
    }

    if (!hasTask) {
      break;
    }

    streak++;

    date = date.subtract(
      Duration(days: 1),
    );
  }

  return streak;
}
}
