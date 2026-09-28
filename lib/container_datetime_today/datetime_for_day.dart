import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        horizontal: 4.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.containercolor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.bordercolor,
        ),
      ),
      width: double.infinity,
      height: 55.h,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
          ),

          FittedBox(
            fit: BoxFit.scaleDown,
            child: IconButton(
              onPressed: () {
                provider.previousDay();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white70,
                size: 20.w,
              ),
            ),
          ),

          FittedBox(
            fit: BoxFit.scaleDown,
            child: Icon(
              Icons.calendar_month_outlined,
              color: Colors.green,
              size: 35.w,
            ),
          ),

          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${provider.selectedDate.day} / ${provider.selectedDate.month} / ${provider.selectedDate.year}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Spacer(),

          FittedBox(
            fit: BoxFit.scaleDown,
            child: IconButton(
              onPressed: () {
                provider.nextDay();
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
                size: 20.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}