import 'package:calafi/components/button.dart';
import 'package:calafi/components/exercise/video.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePlayPage extends StatefulWidget {
  const HomePlayPage({super.key});

  @override
  State<HomePlayPage> createState() => _HomePlayPageState();
}

class _HomePlayPageState extends State<HomePlayPage> {
  List<String> products = ['김치','치가'];
  final chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 24,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12,),
                            Text('개쩌는 등운동 루틴',style: AppTextStyles.M24.copyWith(color: AppColor.gray900),),
                            SizedBox(height: 12,),
                            Row(
                              children: [
                                ...products.map((products) => Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Container( padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),decoration: BoxDecoration(color: AppColor.gray200,borderRadius: BorderRadius.circular(50)), child: Text(products,style: AppTextStyles.R16.copyWith(color: AppColor.gray900),)),
                                )),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text('설명',style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                            SizedBox(height: 8,),
                            Text('등을 확실하게 조질 수 있습니다.',style: AppTextStyles.R16.copyWith(color: AppColor.gray900),),
                            SizedBox(height: 20,),
                            Text('목록',style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                          ],
                        ),
                      ),
                      
                      SizedBox(
                        height: 400,
                        child: ListView(
                          children: [
                            ExerciseVideo(isadd: false,image: 'assets/images/profile.png', detail: '킴펨베의 운동 교실', title: '킴펨베'),
                            ExerciseVideo(isadd: false,image: 'assets/images/profile.png', detail: '킴펨베의 운동 교실', title: '킴펨베'),
                            ExerciseVideo(isadd: false,image: 'assets/images/profile.png', detail: '킴펨베의 운동 교실', title: '킴펨베'),
                            ExerciseVideo(isadd: false,image: 'assets/images/profile.png', detail: '킴펨베의 운동 교실', title: '킴펨베'),
                            ExerciseVideo(isadd: false,image: 'assets/images/profile.png', detail: '킴펨베의 운동 교실', title: '킴펨베'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 18
                        ),
                        child: Button(state: true, text: '시작하기'),
                      )
                    ],
                  )
                ],
              ),
            ),
            Footer(isClick: 1,)
          ],
        ),
      ),
    );
  }
}