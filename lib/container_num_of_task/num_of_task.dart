import 'package:flutter/material.dart';
import 'package:task_tracker/colors/color.dart';
import 'package:task_tracker/container_num_of_task/this_month.dart';
import 'package:task_tracker/container_num_of_task/this_week.dart';
import 'package:task_tracker/container_num_of_task/this_year.dart';
import 'package:task_tracker/container_num_of_task/today_task.dart';

class NumOfTask
    extends StatelessWidget {
  const NumOfTask({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.containercolor,
        borderRadius:
            BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.bordercolor,
        ),
      ),
      width: double.infinity,
      height: 95,

      child: Row(
        children: [
          Expanded(child: TodayTask()),

          Container(
            width: 1,
            height: 70,
            color: Colors.white24,
          ),

          Expanded(child: ThisWeek()),

          Container(
            width: 1,
            height: 70,
            color: Colors.white24,
          ),

          Expanded(child: ThisMonth()),

          Container(
            width: 1,
            height: 70,
            color: Colors.white24,
          ),

          Expanded(child: ThisYear()),
        ],
      ),
    );
  }
}
