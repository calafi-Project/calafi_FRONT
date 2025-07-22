import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Boardbutton extends StatelessWidget {
  final String text;
  final String icon;
  const Boardbutton({required this.icon,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: Offset(0, 1), // x: 0, y: 1
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
    
        color: AppColor.white
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icon/add/$icon.svg'),
              SizedBox(width: 8,),
              Text(text,style: AppTextStyles.S14.copyWith(color: AppColor.gray900),),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.red
                ),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                child: Text('바로가기',style: AppTextStyles.B12.copyWith(color: AppColor.white),),
              )
            ],
          )
        ],
      ),
    );
  }
}