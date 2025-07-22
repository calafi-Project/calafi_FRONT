import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/days/manage.dart';
import 'package:calafi/provider/weekRoutine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DayManage extends StatefulWidget {
  final String text;
  final int isClick;
  const DayManage({required this.isClick,required this.text,super.key});

  @override
  State<DayManage> createState() => _DayManageState();
}

class _DayManageState extends State<DayManage> {
  final manageController = Get.find<ManageDaysController>();
  final weekController = Get.find<WeekroutineController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        manageController.changeClick(widget.isClick);
        await weekController.weekapi(widget.isClick+1);
      },
      child: Obx(()=>Container(
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: manageController.isClick[widget.isClick]?AppColor.red:AppColor.gray50,
        ),
        child: Text(
          widget.text, style: AppTextStyles.R16.copyWith(color:manageController.isClick[widget.isClick]?AppColor.white:AppColor.gray900),
        ),
      ),)
    );
  }
}