import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tag extends StatelessWidget {
  final String text;
  const Tag({required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.gray200
      ),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              //tag text로 검색 되게
            },
            child: Text(text,style: AppTextStyles.R12.copyWith(color: AppColor.gray600),)
          ),
          SizedBox(width: 8,),
          GestureDetector(
            onTap: (){
              //아마 로컬 저장소에서 검색 기록 관리 하면 그거 삭제 하는 로직
            },
            child: SvgPicture.asset('assets/icon/search/remove.svg')
          )
        ],
      ),
    );
  }
}