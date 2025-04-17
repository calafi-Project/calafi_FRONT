import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class Rank extends StatelessWidget {
  final int again,rutin;
  final String name,image;
  const Rank({required this.image,required this.again,required this.name,required this.rutin,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.gray100,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded( // 이미지 외 영역이 넘치지 않게
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name 오리',
                    style:
                        AppTextStyles.M16.copyWith(color: AppColor.gray900),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColor.gray200,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          '루틴 $rutin회 완료',
                          style: AppTextStyles.R14.copyWith(color: AppColor.gray900),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColor.gray200,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          '주 $again회 연속',
                          style: AppTextStyles.R14.copyWith(color: AppColor.gray900),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            Image.asset(
              image,
              width: 60,
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
