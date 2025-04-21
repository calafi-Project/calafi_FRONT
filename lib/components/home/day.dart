import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/days/homeRutin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DayHome extends StatefulWidget {
  final String text;
  final int isClick;
  const DayHome({required this.isClick,required this.text,super.key});

  @override
  State<DayHome> createState() => _DayHomeState();
}

class _DayHomeState extends State<DayHome> {
  final homeRutinController = Get.find<HomeDayRutinController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        homeRutinController.changeClick(widget.isClick);
      },
      child: Obx(()=>Container(
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: homeRutinController.isClick[widget.isClick]?AppColor.red:AppColor.gray50,
        ),
        child: Text(
          widget.text, style: AppTextStyles.R16.copyWith(color:homeRutinController.isClick[widget.isClick]?AppColor.white:AppColor.gray900),
        ),
      ),)
    );
  }
}