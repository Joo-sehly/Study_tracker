import 'package:flutter/material.dart';
import 'package:task_tracker/Banner_detils/banners.dart';
import 'package:task_tracker/container_datetime_today/datetime_for_day.dart';
import 'package:task_tracker/container_grid/grid_container.dart';
import 'package:task_tracker/container_num_of_task/num_of_task.dart';
import 'package:task_tracker/navigations/nav_bar.dart';
import 'package:task_tracker/todo_list/container_todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return NavBar();
  }
}

class HomeContent
    extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Banners(),
          SizedBox(height: 10),
          NumOfTask(),
          SizedBox(height: 10),
          GridContainer(),
          SizedBox(height: 10),
          DatetimeForDay(),
          SizedBox(height: 10),
          ContainerTodoList(),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}
