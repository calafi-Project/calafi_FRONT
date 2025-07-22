import 'package:calafi/components/member/text.dart';
import 'package:calafi/config/app_color.dart';
import 'package:flutter/material.dart';

class BodyState extends StatefulWidget {
  final int weight;  // kg 정수
  final int height;  // cm 정수
  final int age;
  final bool isMale;

  const BodyState({
    super.key,
    required this.weight,
    required this.height,
    required this.age,
    this.isMale = true,
  });

  @override
  State<BodyState> createState() => _BodyStateState();
}

class _BodyStateState extends State<BodyState> {

  initState(){
    super.initState();
    print(widget.weight);
    print(widget.height);
    print(widget.age);
  }

  @override
  Widget build(BuildContext context) {
    final double heightMeter = widget.height / 100.0;
    final double bmi = widget.weight / (heightMeter * heightMeter);
    final double bmr = 10 * widget.weight + 6.25 * widget.height - 5 * widget.age + (widget.isMale ? 5 : -161);
    final double fatRate = 1.20 * bmi + 0.23 * widget.age + (widget.isMale ? -16.2 : -5.4);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.gray200, width: 1),
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MemberText(text: bmi.toStringAsFixed(1), title: 'BMI'),
          Container(width: 1, height: 16, color: AppColor.blue),
          MemberText(text: '${bmr.toStringAsFixed(0)}kcal', title: '기초 대사량'),
          Container(width: 1, height: 16, color: AppColor.blue),
          MemberText(text: '${fatRate.toStringAsFixed(1)}%', title: '체지방률'),
        ],
      ),
    );
  }
}
