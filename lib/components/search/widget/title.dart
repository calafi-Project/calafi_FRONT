import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class SearchTitle extends StatelessWidget {
  final String text;
  const SearchTitle({required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(text,style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
    );
  }
}