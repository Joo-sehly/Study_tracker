import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_tracker/colors/color.dart';
import 'package:task_tracker/container_grid/color_of_task.dart';

class YearProgress
    extends StatelessWidget {
  const YearProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:
              EdgeInsetsGeometry.only(
                right: 20.w,
                top: 50.h,
              ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Icon(
            Icons
                .calendar_month_outlined,
            size: 35.w,
            color: Colors.green,
          ),
        ),
        SizedBox(width: 15.w),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Year Progress",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight:
                  FontWeight.bold,
              color: Colors.white,
            ),

            //          Soon ---> move between years
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              SnackBar(
                content:
                    ColorOfTask(),
                backgroundColor:
                    AppColors.primary,
              ),
            );
          },
          icon: Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
