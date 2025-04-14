import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NameHeader extends StatelessWidget {
  final String text;
  const NameHeader({required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.gray50
      ),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/icon/back.svg'),
          Text(text,style: AppTextStyles.S20.copyWith(color: AppColor.gray900),),
          SizedBox()
        ],
      ),
    );
  }
}