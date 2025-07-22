import 'package:calafi/components/home/day.dart';
import 'package:calafi/config/app_color.dart';
import 'package:flutter/material.dart';

class DaysHome extends StatefulWidget {
  const DaysHome({super.key});

  @override
  State<DaysHome> createState() => _DaysHomeState();
}

class _DaysHomeState extends State<DaysHome> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.gray50
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DayHome(isClick: 0, text: '월'),
          DayHome(isClick: 1, text: '화'),
          DayHome(isClick: 2, text: '수'),
          DayHome(isClick: 3, text: '목'),
          DayHome(isClick: 4, text: '금'),
          DayHome(isClick: 5, text: '토'),
          DayHome(isClick: 6, text: '일'),
        ],
      ),
    );
  }
}