
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_tracker/colors/color.dart';
import 'package:task_tracker/navigations/home_page.dart';
import 'package:task_tracker/navigations/profile.dart';
import 'package:task_tracker/navigations/stop_watch_page.dart';
import 'package:task_tracker/navigations/timer_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() =>
      _NavBarState();
}

class _NavBarState
    extends State<NavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> navPage = [
      const HomeContent(),
      StopWatchPage(),
      TimerPage(),
      Profile(),
    ];
    
    return Scaffold(
      backgroundColor:
    AppColors.primary,
      body: IndexedStack(
        index: selectedIndex,
        children: navPage,
      ),

      bottomNavigationBar: SafeArea(
        child: CurvedNavigationBar(
          height: 50.h,
          index: selectedIndex,
          color:
              Color(0xFF032443),
          backgroundColor:
              Color.fromARGB(255, 7, 56, 99),
              buttonBackgroundColor:Colors.green,
          items: const [
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.timer_outlined,
              size: 30,
              color: AppColors.icon,
            ),
            Icon(
              Icons.access_time,
              size: 30,
              color: AppColors.icon,
            ),
          ],

          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
