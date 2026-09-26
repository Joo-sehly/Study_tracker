import 'package:flutter/material.dart';
import 'package:task_tracker/Banner_detils/banners.dart';
import 'package:task_tracker/colors/color.dart';
import 'package:task_tracker/timer/timer_watch.dart';

// import 'package:task_tracker/colors/color.dart';

class TimerPage
    extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() =>
      _StopWatchPageState();
}

class _StopWatchPageState
    extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Banners(),
      
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors
                  .containercolor,
              borderRadius:
                  BorderRadius.circular(
                    20,
                  ),
              border: Border.all(
                color:
                    AppColors.bordercolor,
              ),
            ),
            width: double.infinity,
            height: 500,
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .start,
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons
                          .timer_outlined,
                      color: Colors.green,
                      size: 45,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Timer",
                      style: TextStyle(
                        color:
                            Colors.white,
                        fontSize: 25,
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),
                  ],
                ),
      
                SizedBox(height: 80),
      
                TimerWatch(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
