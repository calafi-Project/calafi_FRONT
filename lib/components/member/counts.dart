import 'package:calafi/components/member/text.dart';
import 'package:calafi/config/app_color.dart';
import 'package:flutter/material.dart';

class MemberCount extends StatelessWidget {
  const MemberCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.gray50
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MemberText(text: '1h 24m', title: '운동한 시간'),
          Container(
            width: 1,
            height: 16,
            decoration: BoxDecoration(
              color: AppColor.blue
            ),
          ),
          MemberText(text: '8개', title: '완료한 루틴'),
          Container(
            width: 1,
            height: 16,
            decoration: BoxDecoration(
              color: AppColor.blue
            ),
          ),
          MemberText(text: '12023', title: '소모 칼로리'),
        ],
      ),
    );
  }
}