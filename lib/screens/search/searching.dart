import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/components/search/widget/tag.dart';
import 'package:calafi/config/app_color.dart';

class Searching extends StatelessWidget {
  const Searching({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('최근 검색어',style: AppTextStyles.S18.copyWith(color: AppColor.gray900),),
                      
                      GestureDetector(
                        onTap: (){
                          //전체 삭제 로직
                        },
                        child: Row(
                          children: [
                            Text('전체 삭제',style: AppTextStyles.M14.copyWith(color: AppColor.gray400),),
                            SizedBox(width: 4,),
                            SvgPicture.asset('assets/icon/search/remove.svg')
                          ],
                        ),
                      )
                    ],
                  ),

                  //tags
                  //로컬 저장소에서 검색 기록들 List로 가져와서 map으로 처리
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      Tag(text: '덤밸 컬'),
                    ],
                  )
                ],
              ),
            );
  }
}