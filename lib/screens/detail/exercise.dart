import 'package:calafi/components/chat/chat.dart';
import 'package:calafi/components/chat/chatButton.dart';
import 'package:calafi/components/exercise/video.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  final List<String> products = ['덤벨','팔'];
  ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Header(),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(height: 40,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text('덤벨 컬',style: AppTextStyles.M30,),
                              SizedBox(height: 12,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 6,horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColor.red
                                  ),
                                  child: Center(
                                    child: Text('아령(덤벨)을 들고 팔을 굽히는 운동',style: AppTextStyles.R16.copyWith(color: AppColor.white),),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 24,),
                      
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('필요 물품 : ',style: AppTextStyles.R16.copyWith(color: AppColor.gray900),),
                                    Text('${products[0]} ',style: AppTextStyles.R16.copyWith(color: AppColor.red)),
                                    ...products.sublist(1).map((products) => Text('$products ',style: AppTextStyles.R16.copyWith(color: AppColor.gray900),)),
                                  ],
                                ),
                                SizedBox(height: 24,),
                                
                                Text('가이드',style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                                SizedBox(height: 8,),
                            
                                Text('단순히 덤벨을 들었다 내렸다하는 쉬운 동작처럼 보이지만 많은 사람들이 자세를 잘못 알고 있는 운동 중 하나이기도 하다.',style: AppTextStyles.R16.copyWith(color: AppColor.gray900,)),
                                SizedBox(height: 24,),
                            
                                Text('영상',style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                                SizedBox(height: 8,),
                              ],
                            ),
                          ),
                      
                          SizedBox(
                            height: 400,
                            child: ListView(
                              children: [
                                ExerciseVideo(isadd: true,image: 'assets/images/profile.png', detail: '킴펨베의 운동 교실', title: '킴펨베'),
                                ExerciseVideo(isadd: true,image: 'assets/images/profile.png', detail: '킴펨베의 운동 교실', title: '킴펨베'),
                                ExerciseVideo(isadd: true,image: 'assets/images/profile.png', detail: '킴펨베의 운동 교실', title: '킴펨베'),
                                ExerciseVideo(isadd: true,image: 'assets/images/profile.png', detail: '킴펨베의 운동 교실', title: '킴펨베'),
                                ExerciseVideo(isadd: true,image: 'assets/images/profile.png', detail: '킴펨베의 운동 교실', title: '킴펨베'),
                                ExerciseVideo(isadd: true,image: 'assets/images/profile.png', detail: '킴펨베의 운동 교실', title: '킴펨베'),
                                ExerciseVideo(isadd: true,image: 'assets/images/profile.png', detail: '킴펨베의 운동 교실', title: '킴펨베'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Footer(isClick: 0,)
              ],
            ),
            Chat(chats: [['칼라피오리','이거 완전 대박이노','assets/images/profile.png'],['칼라피오리','이거 완전 대박이노','assets/images/profile.png']]),
            Chatbutton()
          ],
        )
      ),
    );
  }
}