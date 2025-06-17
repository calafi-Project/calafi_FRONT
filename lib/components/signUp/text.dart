import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class TextUnder extends StatelessWidget {
  final String text;
  const TextUnder({required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColor.gray400, width: 1))
      ),
      child: Column(
        children: [
          Text(text,style: AppTextStyles.R12.copyWith(color: AppColor.gray400),),
        ],
      ),
    );
  }
}