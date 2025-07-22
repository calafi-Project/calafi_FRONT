import 'package:calafi/components/profile.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/util/getGrade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MemberProfile extends StatelessWidget {
  final String name,image;
  final int follower,folling,grade;
  final int id;
  final bool isMy;

  const MemberProfile({required this.isMy, required this.id,required this.folling,required this.follower,required this.grade,required this.image,required this.name,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Profile(image: image, size: 48),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: AppTextStyles.S20.copyWith(color: AppColor.gray900),),
                GestureDetector(
                  onTap: (){
                    Get.toNamed('Follow',parameters: {'id':'$id','isMy':'$isMy'});
                  },
                  child: Row(
                    children: [
                      Text('팔로워',style: AppTextStyles.R12.copyWith(color: AppColor.gray400),),
                      SizedBox(width: 4,),
                      Text('$follower',style: AppTextStyles.M12.copyWith(color: AppColor.gray900),),
                      Container(
                        width: 4,
                        height: 12,
                        decoration: BoxDecoration(
                          border: Border(right: BorderSide(color: AppColor.gray400,width: 1))
                        ),
                      ),
                      SizedBox(width: 4,),
                      Text('팔로잉',style: AppTextStyles.R12.copyWith(color: AppColor.gray400),),
                      SizedBox(width: 4,),
                      Text('$folling',style: AppTextStyles.M12.copyWith(color: AppColor.gray900),),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            Text(getGrade(grade),style: AppTextStyles.R12.copyWith(color: AppColor.gray500),),
            SizedBox(width: 4,),
            GestureDetector(
              onTap: (){
                Get.toNamed('Rank',);
              },
              child: SvgPicture.asset('assets/icon/quest.svg')
            )
          ],
        )
      ],
    );
  }
}
