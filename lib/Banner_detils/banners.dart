import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/todo_list/task_provider.dart';

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context)
        .size
        .shortestSide;
    final taskProvider =
        Provider.of<TaskProvider>(
          context,
        );
    return Container(
      width: double.infinity,
      height: 170,
    
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/banner_screen.jpeg",
          ),
          fit: BoxFit.cover,
        ),
      ),

      padding: EdgeInsets.only(
        left: size * 0.025,
        top: size * 0.13,
      ),

      child: Row(
        children: [
          Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .start,
            children: [
              Text(
                "Focus Today",
                style: TextStyle(
                  color: Colors.white,
                  fontSize:
                      size * 0.070,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              Text(
                "Build Tomorrow",
                style: TextStyle(
                  color: Colors.green,
                  fontSize:
                      size * 0.070,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              Text(
                "small step every day\nlead to big result",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize:
                      size * 0.025,
                ),
              ),
            ],
          ),

          SizedBox(width: size * 0.15),

          Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(
                      top: size * 0.10,
                    ),
              ),

              Text(
                "🔥 ${taskProvider.getStreak()}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size * 0.09,
                ),
              ),

              Text(
                "Day Streak",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize:
                      size * 0.035,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
