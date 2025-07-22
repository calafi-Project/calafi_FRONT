import 'package:calafi/components/add/boardButton.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddboardPage extends StatelessWidget {
  const AddboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    SizedBox(height: 24,),
                    Row(
                      children: [
                        Expanded(child: GestureDetector(
                          onTap: (){
                            Get.toNamed('/ExerciseUpload');
                          },
                          child: Boardbutton(icon: 'camera', text: '운동 제작'))),
                        SizedBox(width: 12,),
                        Expanded(child: GestureDetector(
                          onTap: (){
                            Get.toNamed('/RoutineUpload');
                          },
                          child: Boardbutton(icon: 'upload', text: '루틴 제작'))),
                      ],
                    ),
                    SizedBox(height: 12,),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed('/Manage');
                      },
                      child: Boardbutton(icon: 'table', text: '요일별 루틴 관리')
                    ),
                  ],
                ),
              ),
            ),
            Footer(isClick: 0)
          ],
        ),
      ),
    );
  }
}