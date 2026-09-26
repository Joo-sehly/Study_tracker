import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/colors/color.dart';
import 'package:task_tracker/todo_list/task_provider.dart';

class DatetimeForDay extends StatelessWidget {
  const DatetimeForDay({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
    
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.containercolor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.bordercolor,
        ),
      ),
      width: double.infinity,
      height: 55,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
          ),

          IconButton(
            onPressed: () {
              provider.previousDay();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white70,
              size: 20,
            ),
          ),

          Icon(
            Icons.calendar_month_outlined,
            color: Colors.green,
            size: 35,
          ),

          Text(
            '${provider.selectedDate.day} / ${provider.selectedDate.month} / ${provider.selectedDate.year}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          Spacer(),

          IconButton(
            onPressed: () {
              provider.nextDay();
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white70,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}