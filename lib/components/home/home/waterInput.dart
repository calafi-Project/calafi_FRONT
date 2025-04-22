import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class Waterinput extends StatelessWidget {
  final TextEditingController controller;
  final String title,ex;
  const Waterinput({required this.controller,required this.ex,required this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: AppTextStyles.M16.copyWith(color: AppColor.gray900),),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColor.gray300,width: 1)
                    ),
                    child: TextFormField(
                      controller: controller,
                      style: AppTextStyles.R16.copyWith(color: AppColor.gray900),
                      decoration: InputDecoration(
                        hintText: ex,
                        hintStyle: AppTextStyles.R16.copyWith(color: AppColor.gray400, letterSpacing: 0),
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