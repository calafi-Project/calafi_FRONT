import 'package:calafi/components/exercise/video.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/components/member/counts.dart';
import 'package:calafi/components/member/profile.dart';
import 'package:calafi/components/member/selector.dart';
import 'package:calafi/components/search/rutin.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/selector/member.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MemberPage extends StatefulWidget {

  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  final memberController = Get.find<MemberController>();
  bool isSecret = false;
  bool isFollow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Header(),

            //프로필
            Expanded(
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.gray50,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 24),
                    child: Column(
                      children: [
                        MemberProfile(folling: 1,follower: 12,grade: 1,image: 'assets/images/profile.png',name: '칼라피오리',),
                        SizedBox(height: 24,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              isFollow = !isFollow;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isFollow?AppColor.blue:AppColor.red,
                              borderRadius: BorderRadius.circular(4)
                            ),
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Center(child: Text(isFollow?'팔라우 중':'팔로우',style: AppTextStyles.S14.copyWith(color: AppColor.white),)),
                          ),
                        )
                      ],
                    ),
                  ),
                  
                  MemberCount(),
              
                  MemberSelector(),

                  isSecret?Container(
                    padding: EdgeInsets.symmetric(vertical: 74),
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/icon/secret.svg'),
                        SizedBox(height: 24,),
                        Text('비공개로 설정 되어있습니다.',style: AppTextStyles.M16.copyWith(color: AppColor.gray500),),
                      ],
                    ),
                  ):Obx(()=>SizedBox(
                    height: 360,
                    child: memberController.isSelector.value?ListView.builder(
                      itemCount: 131,
                      itemBuilder: (context, index) {
                        return Rutin(isEvery: true,title: '개쩌는 등 운동 루틴',heartCount: 2122,document: '등을 확실하게 조질 수 있습니다.',isHeart: false,name: "칼라피오리",image: 'assets/images/profile.png',);
                      },
                    ):
                    ListView.builder(
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return ExerciseVideo(isadd: true,image: 'assets/images/profile.png', detail: '킴펨베의 운동 교실', title: '킴펨베');
                      },
                    ),
                  ))
                ],
              ),
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}