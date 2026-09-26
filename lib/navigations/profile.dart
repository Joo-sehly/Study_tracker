import 'package:flutter/material.dart';
import 'package:task_tracker/colors/color.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("profile Page",style: TextStyle(color: Colors.white),),
        
      ),
      backgroundColor: AppColors.primary,
    );
  }
}
