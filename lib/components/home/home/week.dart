import 'package:calafi/components/home/home/weekText.dart';
import 'package:calafi/config/app_color.dart';
import 'package:flutter/material.dart';

class Week extends StatelessWidget {
  final List<int> state;
  const Week({required this.state,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.gray50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Weektext(state: state[0], text: '월'),
          Weektext(state: state[1], text: '화'),
          Weektext(state: state[2], text: '수'),
          Weektext(state: state[3], text: '목'),
          Weektext(state: state[4], text: '금'),
          Weektext(state: state[5], text: '토'),
          Weektext(state: state[6], text: '일'),
        ],
      ),
    );
  }
}