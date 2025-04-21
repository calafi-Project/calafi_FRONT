import 'package:calafi/components/member/text.dart';
import 'package:calafi/config/app_color.dart';
import 'package:flutter/material.dart';

class BodyState extends StatelessWidget {
  const BodyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.gray200,width: 1),
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8)
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MemberText(text: '23.6', title: 'BMI'),
          Container(
            width: 1,
            height: 16,
            decoration: BoxDecoration(
              color: AppColor.blue
            ),
          ),
          MemberText(text: '1550kcal', title: '기초 대사량'),
          Container(
            width: 1,
            height: 16,
            decoration: BoxDecoration(
              color: AppColor.blue
            ),
          ),
          MemberText(text: '26.1%', title: '체지방률'),
        ],
      ),
    );
  }
}