import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/components/home/days.dart';
import 'package:calafi/components/home/homeRutin.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/days/homeRutin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeRutinPage extends StatefulWidget {
  const HomeRutinPage({super.key});

  @override
  State<HomeRutinPage> createState() => _HomeRutinPageState();
}

class _HomeRutinPageState extends State<HomeRutinPage> {
  final homeRutinController = Get.find<HomeDayRutinController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            DaysHome(),
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
                          child: Obx(()=>Text('${homeRutinController.day} 루틴',style: AppTextStyles.S18.copyWith(color: AppColor.gray900),)),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 30,
                            itemBuilder: (context, index) {
                              return Homerutin(isEvery: true,name: "칼라피오리",document: '등을 확실하게 조질 수 있습니다.',title: '개쩌는 등운동 루틴',image: 'assets/images/profile.png',);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Footer(isClick: 1)
          ],
        ),
      ),
    );
  }
}