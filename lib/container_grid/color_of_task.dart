import 'package:flutter/material.dart';
import 'package:task_tracker/colors/color.dart';

class ColorOfTask extends StatelessWidget {
  const ColorOfTask({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.shortestSide;

    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.03,
                  ),
                ),
                Icon(
                  Icons.square,
                  color: AppColors.zeroTaskColor,
                  size: width * 0.05,
                ),
                Text(
                  "0 Task",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: width * 0.035,
                  ),
                ),
              ],
            ),
          ],
        ),

        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.03,
                  ),
                ),
                Icon(
                  Icons.square,
                  color: AppColors.oneTaskColor,
                  size: width * 0.05,
                ),
                Text(
                  "1 Task",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: width * 0.035,
                  ),
                ),
              ],
            ),
          ],
        ),

        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.03,
                  ),
                ),
                Icon(
                  Icons.square,
                  color: AppColors.twoTaskColor,
                  size: width * 0.05,
                ),
                Text(
                  "2 Task",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: width * 0.035,
                  ),
                ),
              ],
            ),
          ],
        ),

        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.03,
                  ),
                ),
                Icon(
                  Icons.square,
                  color: const Color.fromARGB(
                    255,
                    0,
                    77,
                    3,
                  ),
                  size: width * 0.05,
                ),
                Text(
                  "3 Task",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: width * 0.035,
                  ),
                ),
              ],
            ),
          ],
        ),

        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.03,
                  ),
                ),
                Icon(
                  Icons.square,
                  color: AppColors.fourTaskColor,
                  size: width * 0.05,
                ),
                Text(
                  "+4 Task",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: width * 0.035,
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
