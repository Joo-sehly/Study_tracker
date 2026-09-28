import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/todo_list/task_provider.dart';

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    

    final taskProvider =
        Provider.of<TaskProvider>(
          context,
        );
    return Container(
      width: double.infinity,
      height: 170.h,

      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/banner_screen.jpeg",
          ),
          fit: BoxFit.cover,
        ),
      ),

      padding: EdgeInsets.only(
        left: 9.6.w, // 9.6
        top: 49.92.h, //49.92
      ),

      child: Row(
        children: [
          Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Focus Today",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        26.88.sp, //26.88
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),

              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Build Tomorrow",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize:
                        26.88.sp, //26.88
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),

              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "small step every day\nlead to big result",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize:
                        9.6.sp, //9.6,
                  ),
                ),
              ),
            ],
          ),

          FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(
              width: 57.6.w,
            ),
          ), //57.6

          FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(
                        top:
                            38.4.h, //38.4
                      ),
                ),
            
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "🔥 ${taskProvider.getStreak()}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          34.56.sp, //34.56
                    ),
                  ),
                ),
            
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Day Streak",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize:
                          13.44.sp, //13.44
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
