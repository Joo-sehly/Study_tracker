import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_tracker/Banner_detils/banners.dart';
import 'package:task_tracker/colors/color.dart';
import 'package:task_tracker/timer/stop_watch_timer.dart';

// import 'package:task_tracker/colors/color.dart';

class StopWatchPage
    extends StatefulWidget {
  const StopWatchPage({super.key});

  @override
  State<StopWatchPage> createState() =>
      _StopWatchPageState();
}

class _StopWatchPageState
    extends State<StopWatchPage> {
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
            height: 400.h,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .start,
                  children: [
                    SizedBox(width: 10.w),
                    Icon(
                      Icons
                          .timer_outlined,
                      color: Colors.green,
                      size: 45.w,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "Stop Watch",
                      style: TextStyle(
                        color:
                            Colors.white,
                        fontSize: 25.sp,
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),
                  ],
                ),
      
                SizedBox(height: 80.h),
      
                StopWatchTimer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
