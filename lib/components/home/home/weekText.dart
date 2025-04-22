import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Weektext extends StatelessWidget {
  final String text;
  final int state;
  const Weektext({required this.state,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text,style: AppTextStyles.R16.copyWith(color: AppColor.gray900),),
        SizedBox(height: 8,),
        
        if (state==1) SvgPicture.asset('assets/icon/week/complite.svg'),
        if (state==2) SvgPicture.asset('assets/icon/week/ing.svg'),
        if (state==3) SvgPicture.asset('assets/icon/week/dint.svg'),
      ],
    );
  }
}