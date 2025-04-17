import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class MyInfoText extends StatelessWidget {
  final String text,title;
  const MyInfoText({required this.title,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppTextStyles.R14.copyWith(color: AppColor.gray400),),
        SizedBox(height: 10,),
        Text(text,style: AppTextStyles.R16.copyWith(color: AppColor.gray900),),
      ],
    );
  }
}