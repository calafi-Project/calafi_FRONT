import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatelessWidget {
  final TextEditingController controller;
  const Search({required this.controller,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.gray50,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: AppColor.gray200,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                style: AppTextStyles.R16.copyWith(color: AppColor.gray900),
                decoration: InputDecoration(
                      hintText: '운동, 루틴, 회원 검색',
                      hintStyle: AppTextStyles.R16.copyWith(color: AppColor.gray400,letterSpacing: 0),
                          border: InputBorder.none, // 기본 밑줄 제거
                          enabledBorder: InputBorder.none, // 활성화 상태 밑줄 제거
                          focusedBorder: InputBorder.none, // 포커스 시 밑줄 제거
                          disabledBorder: InputBorder.none, // 비활성화 상태 밑줄 제거
                          // contentPadding: EdgeInsets.zero, // 내부 패딩 조정 (선택사항)
                    ),
              ),
            ),
            Row(
              children: [
                SvgPicture.asset('assets/icon/search/cancel.svg'),
                SizedBox(width: 10,),
                SvgPicture.asset('assets/icon/search/search.svg'),
              ],
            )
          ],
        ),
      ),
    );
  }
}