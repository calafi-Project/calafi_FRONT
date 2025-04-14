import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final bool state;
  const Button({required this.state,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: state?AppColor.red:AppColor.gray
      ),
      child: Center(
        child: Text(text,style: AppTextStyles.S16.copyWith(color: AppColor.white),),
      ),
    );
  }
}