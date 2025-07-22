import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class Inputadd extends StatelessWidget {
  final String hint,text;
  final TextEditingController controller;
  const Inputadd({required this.controller,required this.hint,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12,),
         Text(
                      text,
                      style: AppTextStyles.M14.copyWith(color: AppColor.gray900),
                    ),
                    SizedBox(height: 8,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColor.gray400, width: 1),
                      ),
                      child: TextFormField(
                        controller: controller,
                        style: AppTextStyles.R16.copyWith(color: AppColor.gray900),
                        decoration: InputDecoration(
                          hintText: hint,
                          hintStyle: AppTextStyles.R16.copyWith(
                            color: AppColor.gray400,
                            letterSpacing: 0,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
      ],
    );
  }
}