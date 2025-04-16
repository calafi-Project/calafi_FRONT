import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class MemberText extends StatelessWidget {
  final String title,text;
  const MemberText({required this.text,required this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Text(text,style: AppTextStyles.S14.copyWith(color: AppColor.red),),
            SizedBox(height: 8,),
            Text(title,style: AppTextStyles.R12.copyWith(color: AppColor.gray800),),
            
          ],
        );
  }
}