import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StopWatchTimer
    extends StatefulWidget {
  const StopWatchTimer({super.key});

  @override
  State<StopWatchTimer> createState() =>
      _StopWatchTimerState();
}

class _StopWatchTimerState
    extends State<StopWatchTimer> {
  Timer? timer;
  Duration duration = Duration.zero;
  bool isRunning = false;

  void startStopTimer() {
    if (isRunning) {
      timer?.cancel();
      setState(() {
        isRunning = false;
      });
    } else {
      setState(() {
        isRunning = true;
      });
      timer = Timer.periodic(
        Duration(seconds: 1),
        (timer) {
          setState(() {
            duration += const Duration(
              seconds: 1,
            );
          });
        },
      );
    }
  }

  void resetTimer() {
    timer?.cancel();
    setState(() {
      duration = Duration.zero;
      isRunning = false;
    });
  }

  String foramatTime(
    Duration duration,
  ) {
    String hour = duration.inHours
        .toString()
        .padLeft(2, '0');

    String minute = duration.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, '0');

    String second = duration.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');

    return "$hour:$minute:$second";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            foramatTime(duration),
            style: TextStyle(
              color: Colors.white,
              fontSize: 50.sp,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
        ),

        FittedBox(
          fit: BoxFit.scaleDown,
          child: SizedBox(height: 20.h),
        ),

        Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Container(
                height: 80.h,
                width: 80.w,
                decoration:
                    BoxDecoration(
                      shape: BoxShape
                          .circle,
                      border: Border.all(
                        color: Colors
                            .white,
                        width: 3.w,
                      ),
                    ),
                child: IconButton(
                  onPressed: resetTimer,
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 40.w,
                  ),
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                width: 35.w,
              ),
            ),

            FittedBox(
              fit: BoxFit.scaleDown,
              child: Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  shape:
                      BoxShape.circle,
                  color: Colors.green,
                  border: Border.all(
                    color: Colors
                        .lightGreenAccent,
                    width: 3.w,
                  ),
                ),
                child: IconButton(
                  onPressed:
                      startStopTimer,
                  icon: Icon(
                    isRunning
                        ? Icons.pause
                        : Icons
                              .play_arrow,
                    color: Colors.white,
                    size: 50.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
