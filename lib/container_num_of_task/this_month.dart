import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/todo_list/task_provider.dart';

class ThisMonth
    extends StatelessWidget {
  const ThisMonth({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context
        .watch<TaskProvider>();
    // return LayoutBuilder(
    // builder: (context, constraints) {
    // double width = constraints.maxWidth;
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        // Padding(
        //   padding: EdgeInsets.only(
        //     right: 9.w,
        //     top: 6.h,
        //   ),
        // ),

        Icon(
         Icons
             .calendar_month_outlined,
         size: 35.r,
         color: Colors.deepPurple,
                  ),

        Text(
          "This Month",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 13.sp,
            fontWeight:
                FontWeight.bold,
          ),
        ),

        Text(
         '${taskProvider.getTasksThisMonth()}',
         style: TextStyle(
           color: Colors.white,
           fontSize: 18.sp,
           fontWeight:
               FontWeight.bold,
         ),
                  ),
      ],
    );
    // },
    // );
  }
}
