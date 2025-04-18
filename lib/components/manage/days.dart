import 'package:calafi/components/manage/day.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/provider/days/manage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaysManage extends StatefulWidget {
  const DaysManage({super.key});

  @override
  State<DaysManage> createState() => _DaysManageState();
}

class _DaysManageState extends State<DaysManage> {
  final manageController = Get.find<ManageDaysController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.gray50
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DayManage(isClick: 0, text: '월'),
          DayManage(isClick: 1, text: '화'),
          DayManage(isClick: 2, text: '수'),
          DayManage(isClick: 3, text: '목'),
          DayManage(isClick: 4, text: '금'),
          DayManage(isClick: 5, text: '토'),
          DayManage(isClick: 6, text: '일'),
        ],
      ),
    );
  }
}