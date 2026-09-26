import 'package:flutter/material.dart';
import 'package:task_tracker/colors/color.dart';
import 'package:task_tracker/container_grid/color_of_task.dart';
import 'package:task_tracker/container_grid/heatmap.dart';
import 'package:task_tracker/container_grid/year_progress.dart';

class GridContainer
    extends StatelessWidget {
  const GridContainer({super.key});

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
            border: Border.all(color: AppColors.bordercolor)
      ),

      width: double.infinity,
      height: 260,

      child: Column(
        children: [
          YearProgress(),

          Container(
            height: 1,
            width: 250,
            color: Colors.white70,
          ),

          HeatMap(), //  soon
          SizedBox(height: 15),
          ColorOfTask(),
        ],
      ),
    );
  }
}
