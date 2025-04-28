import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AlramBox extends StatelessWidget {
  final String text,date;
  final bool isState;
  const AlramBox({required this.date,required this.isState,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              offset: Offset(0, 1),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
          color: AppColor.white
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(isState?'assets/icon/alram/foot.svg':'assets/icon/alram/person.svg'),
                SizedBox(width: 6,),
                Text(text,style: AppTextStyles.R14.copyWith(color: AppColor.gray900),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(date,style: AppTextStyles.R12.copyWith(color: AppColor.gray500),)
              ],
            )
          ],
        ),
      ),
    );
  }
}