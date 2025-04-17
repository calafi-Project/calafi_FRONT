import 'package:calafi/components/button.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/components/my/profile.dart';
import 'package:calafi/components/my/text.dart';
import 'package:calafi/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyInfoPage extends StatelessWidget {
  const MyInfoPage({super.key});

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
                        SizedBox(height: 24),
                        MyProfile(),
                        SizedBox(height: 24),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 24,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColor.gray100,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyInfoText(title: '키', text: '171cm'),
                                      MyInfoText(title: '목표 몸무게', text: '64kg'),
                                      SizedBox(), // 이건 나중에 아이콘 등으로 바꿔도 좋아요
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  MyInfoText(title: '이름', text: '정소울'),
                                  SizedBox(height: 20),
                                  MyInfoText(
                                      title: '이메일 계정',
                                      text: '12312321@gmail.com'),
                                  SizedBox(height: 20),
                                  MyInfoText(title: '남자', text: '남'),
                                ],
                              ),
                            ),
                            SizedBox(height: 24),
                            GestureDetector(
                              onTap: (){
                                Get.toNamed('MyUpdate');
                              },
                              child: Button(state: true, text: '수정')
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Footer(isClick: 4),
          ],
        ),
      ),
    );
  }
}
