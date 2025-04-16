import 'package:calafi/components/profile.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class Chatting extends StatelessWidget {
  final String name,image,detail;
  const Chatting({required this.detail,required this.image,required this.name,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16,bottom: 12),
      child: Row(
        children: [
          Profile(image: image, size: 24),
          SizedBox(width: 8,),
          Text(name,style: AppTextStyles.R14.copyWith(color: AppColor.gray600),),
          SizedBox(width: 12,),
          Text(detail,style: AppTextStyles.R14.copyWith(color: AppColor.gray900))
        ],
      ),
    );
  }
}