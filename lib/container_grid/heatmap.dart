import 'package:flutter/material.dart';
import 'package:contribution_heatmap/contribution_heatmap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/colors/color.dart';
import 'package:task_tracker/todo_list/task_provider.dart';

class HeatMap extends StatelessWidget {
  const HeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider =
        Provider.of<TaskProvider>(context);

    List<ContributionEntry> entries = [];
    
    int year=DateTime.now().year;
    for (
      int month = 1;
      month <= 12;
      month++
    ) {
      int days = DateTime(
        year,
        month + 1,
        0,
      ).day;

      for (
        int day = 1;
        day <= days;
        day++
      ) {
        DateTime date = DateTime(
          year,
          month,
          day,
        );

        int count = taskProvider
            .getCompletedTasksOnDate(date);

        entries.add(
          ContributionEntry(
            date,
            count,
          ),
        );
      }
    }

    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
          ),
          child: ContributionHeatmap(
            entries: entries,
            cellSize: 12.h,
            cellSpacing: 3.w,
            cellRadius: 2.w,
            showMonthLabels: true,
            weekdayLabel:
                WeekdayLabel.githubLike,
            splittedMonthView: true,
            customColorScale: (value) {
              if (value == 0) {
                return AppColors.zeroTaskColor;
              }

              if (value == 1) {
                return AppColors.oneTaskColor;
              }

              if (value == 2) {
                return AppColors.twoTaskColor;
              }

              if (value == 3) {
                return AppColors.threeTaskColor;
              }

              return AppColors.fourTaskColor;
            },
          ),
        ),
      ),
    );
  }
}