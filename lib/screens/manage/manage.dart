import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/noHaeder.dart';
import 'package:calafi/components/manage/days.dart';
import 'package:calafi/components/my/manageRutin.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/days/manage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  final manageController = Get.put(ManageDaysController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Nohaeder(),
            DaysManage(),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 600,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Obx(()=>Text('${manageController.day} 루틴',style: AppTextStyles.S18.copyWith(color: AppColor.gray900),)),
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
                          child: Text('나의 루틴',style: AppTextStyles.S18.copyWith(color: AppColor.gray900)),
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
                    ),
                  ),
                ],
              ),
            ),
            Footer(isClick: 3)
          ],
        ),
      ),
    );
  }
}