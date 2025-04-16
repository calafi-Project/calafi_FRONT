import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/selector/member.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberSelector extends StatefulWidget {
  const MemberSelector({super.key});

  @override
  State<MemberSelector> createState() => _MemberSelectorState();
}

class _MemberSelectorState extends State<MemberSelector> {
  final memberController = Get.find<MemberController>();

  @override
  void initState() {
    memberController.changeOpen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Obx(()=>          Expanded(
            child: GestureDetector(
              onTap: (){
                memberController.changeOpen();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.gray50,
                  border: Border(bottom: BorderSide(color:memberController.isSelector.value?AppColor.red:AppColor.gray400,width: 2))
                ),
                child: Column(
                  children: [
                    Text('루틴',style: memberController.isSelector.value?AppTextStyles.S16.copyWith( color: AppColor.gray900):AppTextStyles.M16.copyWith( color: AppColor.gray500),)
                  ],
                ),
              ),
            ),
          ),),
          Obx(()=>Expanded(
            child: GestureDetector(
              onTap: (){
                memberController.changeClose();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.gray50,
                  border: Border(bottom: BorderSide(color:!memberController.isSelector.value?AppColor.red:AppColor.gray400,width: 2))
                ),
                child: Column(
                  children: [
                    Text('운동',style: !memberController.isSelector.value?AppTextStyles.S16.copyWith( color: AppColor.gray900):AppTextStyles.M16.copyWith( color: AppColor.gray500),)
                  ],
                ),
              ),
            ),
          ),)
        ],
      );
  }
}