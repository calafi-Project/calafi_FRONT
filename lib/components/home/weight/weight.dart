import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class WeightInput extends StatelessWidget {
  final TextEditingController controller;
  const WeightInput({required this.controller,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.gray200,width: 1)
      ),
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: Row(
        children: [
          Text('몸무게',style: AppTextStyles.M16.copyWith(color: AppColor.gray900),),
          SizedBox(width: 20,),
          Expanded(
            child: TextFormField(
                controller: controller,
                style: AppTextStyles.R16.copyWith(color: AppColor.gray900),
                decoration: InputDecoration(
                      hintText: '오늘의 몸무게를 입력해주세요.',
                      hintStyle: AppTextStyles.R16.copyWith(color: AppColor.gray400,letterSpacing: 0),
                          border: InputBorder.none, // 기본 밑줄 제거
                          enabledBorder: InputBorder.none, // 활성화 상태 밑줄 제거
                          focusedBorder: InputBorder.none, // 포커스 시 밑줄 제거
                          disabledBorder: InputBorder.none, // 비활성화 상태 밑줄 제거
                          // contentPadding: EdgeInsets.zero, // 내부 패딩 조정 (선택사항)
                    ),
              ),
          )
        ],
      ),
    );
  }
}