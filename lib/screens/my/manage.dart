import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/components/my/exerciseManage.dart';
import 'package:calafi/components/my/manageRutin.dart';
import 'package:calafi/components/my/select.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/selector/manage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyManagePage extends StatefulWidget {
  const MyManagePage({super.key});

  @override
  State<MyManagePage> createState() => _MyManagePageState();
}

class _MyManagePageState extends State<MyManagePage> {
  final myManageController = Get.find<MyManageController>();
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          
          children: [
            Header(),
            MyManageSelector(),
            Expanded(child: Obx(()=>myManageController.isSelector.value?
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('게시된 루틴',style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return MyManageRuntin(isEvery: true,isadd: false,name: "칼라피오리",document: '등을 확실하게 조질 수 있습니다.',title: '개쩌는 등운동 루틴',image: 'assets/images/profile.png',);
                    },
                  ),
                ),
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('나의 루틴',style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return MyManageRuntin(isEvery: true,isadd: true,name: "칼라피오리",document: '등을 확실하게 조질 수 있습니다.',title: '개쩌는 등운동 루틴',image: 'assets/images/profile.png',);
                    },
                  ),
                ),
              ],
            )
            :
                        Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('게시된 루틴',style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return MyManageExerciseVideo(isadd: true,image: 'assets/images/profile.png', detail: '킴펨베의 운동 교실', title: '킴펨베');
                    },
                  ),
                ),
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('나의 루틴',style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return MyManageExerciseVideo(isadd: false,image: 'assets/images/profile.png', detail: '킴펨베의 운동 교실', title: '킴펨베');
                    },
                  ),
                ),
              ],
            ))),
            Footer(isClick: 4,)
          ],
        ),
      ),
    );
  }
}