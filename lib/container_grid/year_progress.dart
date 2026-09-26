import 'package:flutter/material.dart';

class YearProgress
    extends StatelessWidget {
  const YearProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:
              EdgeInsetsGeometry.only(
                right: 20,
                top: 50,
              ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Icon(
            Icons.calendar_month_outlined,
            size: 35,
            color: Colors.green,
          ),
        ),
        SizedBox(width: 15),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Year Progress",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),  
          
            //          Soon ---> move between years
            
          ),
        ),
      ],
    );
  }
}
