import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Timekcal extends StatelessWidget {
  final int hour,minute,second,kcal;
  const Timekcal({required this.hour,required this.kcal,required this.minute,required this.second,super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: AppColor.red,
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icon/week/time.svg'),
              SizedBox(width: 8),
              Text('${hour}h ${minute}m ${second}s',
                  style: AppTextStyles.M16.copyWith(color: AppColor.white)),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icon/week/fire.svg'),
              SizedBox(width: 8),
              Text('$kcal',
                  style: AppTextStyles.S20.copyWith(color: AppColor.white)),
              SizedBox(width: 4),
              Text('kcal',
                  style: AppTextStyles.M16.copyWith(color: AppColor.white)),
            ],
          ),
        ],
      ),
    );
  }
}