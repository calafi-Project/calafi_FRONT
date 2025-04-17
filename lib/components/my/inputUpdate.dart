import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class Inputupdate extends StatelessWidget {
  final String title, hintText;
  final TextEditingController controller;

  const Inputupdate({
    required this.controller,
    required this.hintText,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.R14.copyWith(color: AppColor.gray400),
          ),
          Container(
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColor.gray100,
            ),
            child: TextFormField(
              controller: controller,
              style: AppTextStyles.M16.copyWith(color: AppColor.gray900),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTextStyles.R14.copyWith(
                  color: AppColor.gray400,
                  letterSpacing: 0,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
