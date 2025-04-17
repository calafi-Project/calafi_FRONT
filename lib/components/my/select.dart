import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/selector/manage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyManageSelector extends StatefulWidget {
  const MyManageSelector({super.key});

  @override
  State<MyManageSelector> createState() => _MyManageSelectorState();
}

class _MyManageSelectorState extends State<MyManageSelector> {
  final myManageController = Get.find<MyManageController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      myManageController.isSelector.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Obx(()=>Expanded(
            child: GestureDetector(
              onTap: (){
                myManageController.changeOpen();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.gray50,
                  border: Border(bottom: BorderSide(color:myManageController.isSelector.value?AppColor.red:AppColor.gray400,width: 2))
                ),
                child: Column(
                  children: [
                    Text('루틴',style: myManageController.isSelector.value?AppTextStyles.S16.copyWith( color: AppColor.gray900):AppTextStyles.M16.copyWith( color: AppColor.gray500),)
                  ],
                ),
              ),
            ),
          ),),
          Obx(()=>Expanded(
            child: GestureDetector(
              onTap: (){
                myManageController.changeClose();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.gray50,
                  border: Border(bottom: BorderSide(color:!myManageController.isSelector.value?AppColor.red:AppColor.gray400,width: 2))
                ),
                child: Column(
                  children: [
                    Text('운동',style: !myManageController.isSelector.value?AppTextStyles.S16.copyWith( color: AppColor.gray900):AppTextStyles.M16.copyWith( color: AppColor.gray500),)
                  ],
                ),
              ),
            ),
          ),)
        ],
      );
  }
}