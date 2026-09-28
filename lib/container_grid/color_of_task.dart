import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_tracker/colors/color.dart';

class ColorOfTask
    extends StatelessWidget {
  const ColorOfTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 11.w,
      children: [
        Column(
          mainAxisSize:
              MainAxisSize.min,
          children: [
            Row(
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                Icon(
                  Icons.square,
                  color: AppColors
                      .zeroTaskColor,
                  size: 18.w,
                ),
                SizedBox(width: 4.w),
                Text(
                  "0 Task",
                  style: TextStyle(
                    color:
                        Colors.white70,
                    fontSize: 12.6.sp,
                  ),
                ),
              ],
            ),
          ],
        ),

        Column(
          mainAxisSize:
              MainAxisSize.min,
          children: [
            Row(
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                Icon(
                  Icons.square,
                  color: AppColors
                      .oneTaskColor,
                  size: 18.w,
                ),
                SizedBox(width: 4.w),
                Text(
                  "1 Task",
                  style: TextStyle(
                    color:
                        Colors.white70,
                    fontSize: 12.6.sp,
                  ),
                ),
              ],
            ),
          ],
        ),

        Column(
          mainAxisSize:
              MainAxisSize.min,
          children: [
            Row(
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                Icon(
                  Icons.square,
                  color: AppColors
                      .twoTaskColor,
                  size: 18.w,
                ),
                SizedBox(width: 4.w),
                Text(
                  "2 Task",
                  style: TextStyle(
                    color:
                        Colors.white70,
                    fontSize: 12.6.sp,
                  ),
                ),
              ],
            ),
          ],
        ),

        Column(
          mainAxisSize:
              MainAxisSize.min,
          children: [
            Row(
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                Icon(
                  Icons.square,
                  color:
                      const Color.fromARGB(
                        255,
                        0,
                        77,
                        3,
                      ),
                  size: 18.w,
                ),
                SizedBox(width: 4.w),
                Text(
                  "3 Task",
                  style: TextStyle(
                    color:
                        Colors.white70,
                    fontSize: 12.6.sp,
                  ),
                ),
              ],
            ),
          ],
        ),

        Column(
          mainAxisSize:
              MainAxisSize.min,
          children: [
            Row(
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                Icon(
                  Icons.square,
                  color: AppColors
                      .fourTaskColor,
                  size: 18.w,
                ),
                SizedBox(width: 4.w),
                Text(
                  "+4 Task",
                  style: TextStyle(
                    color:
                        Colors.white70,
                    fontSize: 12.6.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
