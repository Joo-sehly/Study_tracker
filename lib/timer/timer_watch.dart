import 'dart:async';

import 'package:flutter/material.dart';

class TimerWatch
    extends StatefulWidget {
  const TimerWatch({super.key});

  @override
  State<TimerWatch> createState() =>
      _TimerWatchState();
}

class _TimerWatchState
    extends State<TimerWatch> {
  Timer? timer;

  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  Duration remainingTime =
      Duration.zero;

  bool isRunning = false;
  bool isPaused = false;

  late FixedExtentScrollController
  hoursController;
  late FixedExtentScrollController
  minutesController;
  late FixedExtentScrollController
  secondsController;

  @override
  void initState() {
    super.initState();

    hoursController =
        FixedExtentScrollController();
    minutesController =
        FixedExtentScrollController();
    secondsController =
        FixedExtentScrollController();
  }

  // Start
  void startTimer() {
    final duration = Duration(
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );

    if (duration.inSeconds == 0) return;

    setState(() {
      remainingTime = duration;
      isRunning = true;
      isPaused = false;
    });

    runTimer();
  }

  // Timer
  void runTimer() {
    timer?.cancel();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (remainingTime.inSeconds <=
            1) {
          timer.cancel();

          setState(() {
            remainingTime =
                Duration.zero;
            isRunning = false;
            isPaused = false;
          });

          return;
        }

        setState(() {
          remainingTime -=
              const Duration(
                seconds: 1,
              );
        });
      },
    );
  }

  // Pause
  void pauseTimer() {
    timer?.cancel();

    setState(() {
      isPaused = true;
    });
  }

  // Resume
  void resumeTimer() {
    setState(() {
      isPaused = false;
    });

    runTimer();
  }

  // Cancel
  void cancelTimer() {
    timer?.cancel();

    setState(() {
      isRunning = false;
      isPaused = false;

      remainingTime = Duration.zero;

      hours = 0;
      minutes = 0;
      seconds = 0;
    });

    hoursController.jumpToItem(0);
    minutesController.jumpToItem(0);
    secondsController.jumpToItem(0);
  }

  // Format time
  String twoDigits(int value) {
    return value.toString().padLeft(
      2,
      '0',
    );
  }

  String get timeText {
    final h = twoDigits(
      remainingTime.inHours,
    );

    final m = twoDigits(
      remainingTime.inMinutes.remainder(
        60,
      ),
    );

    final s = twoDigits(
      remainingTime.inSeconds.remainder(
        60,
      ),
    );

    return '$h:$m:$s';
  }

  @override
  void dispose() {
    timer?.cancel();

    hoursController.dispose();
    minutesController.dispose();
    secondsController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isRunning) {
      return runningTimer();
    }

    return timerPicker();
  }

  // ==============================
  // اختيار الوقت
  // ==============================

  Widget timerPicker() {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            picker(
              title: 'ساعات',
              controller:
                  hoursController,
              max: 23,
              value: hours,
              onChanged: (value) {
                setState(() {
                  hours = value;
                });
              },
            ),

            const Text(
              ':',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            picker(
              title: 'دقائق',
              controller:
                  minutesController,
              max: 59,
              value: minutes,
              onChanged: (value) {
                setState(() {
                  minutes = value;
                });
              },
            ),

            const Text(
              ':',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            picker(
              title: 'ثواني',
              controller:
                  secondsController,
              max: 59,
              value: seconds,
              onChanged: (value) {
                setState(() {
                  seconds = value;
                });
              },
            ),
          ],
        ),

        const SizedBox(height: 35),

        GestureDetector(
          onTap: startTimer,
          child: Container(
            width: 80,
            height: 80,
            decoration:
                const BoxDecoration(
                  shape:
                      BoxShape.circle,
                  color: Color(
                    0xff4caf50,
                  ),
                ),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 60,
            ),
          ),
        ),
      ],
    );
  }

  // ==============================
  // اختيار الساعة
  // ==============================

  Widget picker({
    required String title,
    required FixedExtentScrollController
    controller,
    required int max,
    required int value,
    required Function(int) onChanged,
  }) {
    return SizedBox(
      width: 100,
      height: 210,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),

          Expanded(
            child: ListWheelScrollView.useDelegate(
              controller: controller,
              itemExtent: 55,
              physics:
                  const FixedExtentScrollPhysics(),
              onSelectedItemChanged:
                  onChanged,
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: max + 1,
                builder: (context, index) {
                  final selected =
                      index == value;

                  return Center(
                    child: Text(
                      twoDigits(index),
                      style: TextStyle(
                        color: selected
                            ? Colors
                                  .white
                            : Colors
                                  .white24,
                        fontSize:
                            selected
                            ? 42
                            : 32,
                        fontWeight:
                            selected
                            ? FontWeight
                                  .bold
                            : FontWeight
                                  .normal,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==============================
  // التايمر أثناء التشغيل
  // ==============================

  Widget runningTimer() {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        Text(
          timeText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 55,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 40),

        Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            // Pause / Resume
            GestureDetector(
              onTap: isPaused
                  ? resumeTimer
                  : pauseTimer,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape:
                      BoxShape.circle,
                  color: isPaused
                      ? const Color(
                          0xff4caf50,
                        )
                      : const Color(
                          0xff722c2c,
                        ),
                ),
                child: Icon(
                  isPaused
                      ? Icons.play_arrow
                      : Icons.pause,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),

            const SizedBox(width: 40),

            // Cancel
            GestureDetector(
              onTap: cancelTimer,
              child: Container(
                width: 80,
                height: 80,
                decoration:
                    const BoxDecoration(
                      shape: BoxShape
                          .circle,
                      color: Color(
                        0xff303036,
                      ),
                    ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
