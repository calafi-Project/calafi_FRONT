import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/setHeader.dart';
import 'package:calafi/components/member/counts.dart';
import 'package:calafi/components/member/profile.dart';
import 'package:calafi/components/member/selector.dart';
import 'package:calafi/components/my/exerciseVideo.dart';
import 'package:calafi/components/my/rutin.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/provider/selector/member.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyPage extends StatelessWidget {
  final memberController = Get.find<MemberController>();
  MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SetHeader(),
            
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
                          ],
                        ),
                      ),
                            
                      MemberCount(),
                            
                      MemberSelector(),
                            
                      Obx(()=>SizedBox(
                        height: 400,
                        child: memberController.isSelector.value?ListView.builder(
                          itemCount: 131,
                          itemBuilder: (context, index) {
                            return RutinDelete(isEvery: true,title: '개쩌는 등 운동 루틴',document: '등을 확실하게 조질 수 있습니다.',name: "칼라피오리",image: 'assets/images/profile.png',);
                          },
                        ):
                        ListView.builder(
                          itemCount: 30,
                          itemBuilder: (context, index) {
                            return ExercisevideoDelete(image: 'assets/images/profile.png', detail: '킴펨베의 운동 교실', title: '킴펨베');
                          },
                        ),
                      ))
                    ],
                  ),
                ),
                Footer(isClick: 4,)
              ],
            ),
            Positioned(
              right: 12,
              bottom: 120,
              child: GestureDetector(
                onTap: (){
                  Get.toNamed('MyManage');
                },
                child: Container(
                  padding: EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.red
                  ),
                  child: SvgPicture.asset('assets/icon/manage.svg'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}