import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/selector/follow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowSelector extends StatefulWidget {
  final int follow,following;
  const FollowSelector({required this.follow,required this.following,super.key});

  @override
  State<FollowSelector> createState() => _FollowSelectorState();
}

class _FollowSelectorState extends State<FollowSelector> {
  final followController = Get.find<FollowController>();

  @override
  void initState() {
    followController.changeOpen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Obx(()=>Expanded(
            child: GestureDetector(
              onTap: (){
                followController.changeOpen();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.gray50,
                  border: Border(bottom: BorderSide(color:followController.isSelector.value?AppColor.red:AppColor.gray400,width: 2))
                ),
                child: Column(
                  children: [
                    Text('팔로워 ${widget.follow}',style: followController.isSelector.value?AppTextStyles.S16.copyWith( color: AppColor.gray900):AppTextStyles.M16.copyWith( color: AppColor.gray500),)
                  ],
                ),
              ),
            ),
          ),),
          Obx(()=>Expanded(
            child: GestureDetector(
              onTap: (){
                followController.changeClose();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.gray50,
                  border: Border(bottom: BorderSide(color:!followController.isSelector.value?AppColor.red:AppColor.gray400,width: 2))
                ),
                child: Column(
                  children: [
                    Text('팔로잉 ${widget.following}',style: !followController.isSelector.value?AppTextStyles.S16.copyWith( color: AppColor.gray900):AppTextStyles.M16.copyWith( color: AppColor.gray500),)
                  ],
                ),
              ),
            ),
          ),)
        ],
      );
  }
}