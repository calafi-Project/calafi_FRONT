import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/components/my/gray.dart';
import 'package:calafi/components/my/profile.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SetPage extends StatefulWidget {
  const SetPage({super.key});

  @override
  State<SetPage> createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  final storage = FlutterSecureStorage();
  final userController = Get.find<UserController>();

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 24,),
                        MyProfile(),
                        SizedBox(height: 24,),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.toNamed('MyInfo');
                              },
                              child: GrayButton(text: '내 정보 보기 및 수정', isOn: false)
                            ),
                            GrayButton(text: '비밀번호 변경', isOn: false),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '공개 설정',
                                  style: AppTextStyles.M20.copyWith(color: AppColor.gray900),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '회원님의 프로필을 다른 회원들이 볼 수 있도록 설정합니다.',
                                  style: AppTextStyles.R14.copyWith(color: AppColor.gray500),
                                ),
                              ],
                            ),
                            SizedBox(height: 14),
                            GrayButton(isWork: userController.isRoutine.value,isOn: true, text: '루틴'),
                            GrayButton(isWork: userController.isWorkout.value,isOn: true, text: '운동'),
                          ],
                        )
                      ],
                    ),
                    
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                storage.delete;
                Get.toNamed('/Onboarding');
              },
              child: Text('로그아웃',style: AppTextStyles.B16.copyWith(color: AppColor.red),)
            ),
            SizedBox(height: 20,),
            Footer(isClick: 4)
          ],
        ),
      ),
    );
  }
}