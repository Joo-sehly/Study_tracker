import 'package:flutter/material.dart';
// import 'package:task_tracker/navigations/home_page.dart';
import 'package:task_tracker/navigations/nav_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBar(),
    );
  }
}