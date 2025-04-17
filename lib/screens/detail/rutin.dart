import 'package:calafi/components/chat/chat.dart';
import 'package:calafi/components/chat/chatButton.dart';
import 'package:calafi/components/exercise/video.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/components/profile.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/chat.dart';
import 'package:calafi/util/getGrade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RutinPage extends StatefulWidget {
  const RutinPage({super.key});

  @override
  State<RutinPage> createState() => _RutinPageState();
}

class _RutinPageState extends State<RutinPage> {
  String grade='';
  List<String> products = ['김치','치가'];
  final chatController = Get.find<ChatController>();

  @override
  void initState() {
    grade = getGrade(1);
    super.initState();
  }

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
                      SizedBox(height: 24,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Profile(image: 'assets/images/profile.png', size: 48),
                                    SizedBox(width: 16,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('칼라피오리',style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                                        Text(grade,style: AppTextStyles.R12.copyWith(color: AppColor.gray500),)
                                      ],
                                    ),
                                  ],
                                ),
                            
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
                      
                        ],
                      )
                    ],
                  ),
                ),
                Footer(isClick: 0,)
              ],
            ),
            Chat(chats: [['칼라피오리','이거 완전 대박이노','assets/images/profile.png'],['칼라피오리','이거 완전 대박이노','assets/images/profile.png']]),
            Chatbutton(),

            Obx(()=>chatController.isOpen.value?SizedBox():Positioned(
              right: 12,
              bottom: 120,
              child: GestureDetector(
                onTap: (){
                  
                },
                child: Container(
                  padding: EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.red
                  ),
                  child: SvgPicture.asset('assets/icon/detail/add.svg'),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}