import 'package:calafi/components/search/exercise.dart';
import 'package:calafi/components/search/members.dart';
import 'package:calafi/components/search/rutin.dart';
import 'package:calafi/components/search/widget/searchTop.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/search.dart';
import 'package:calafi/screens/search/searchevery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Searched extends StatelessWidget {
  final searchController = Get.put(SeaController());
  Searched({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchTop(),
        SizedBox(height: 20),
        Obx(()=>searchController.selector.value == 2?Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('총 23건',style: AppTextStyles.M18.copyWith(color: AppColor.gray900),),
            ),
          ],
        ):SizedBox(),),
        
        Expanded(
          child: Obx(() {
            //전체
            if(searchController.selector.value==0){
              return Searchevery();
            }

            //운동
            if(searchController.selector.value==1){
              return ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Exercise(exerciseName: '덤벨 컬',exerciseTool: ['덤벨','벨트'],isHeart: false,);
                },
              );
            }

            //루틴
            if(searchController.selector.value==2){
              return ListView.builder(
                itemCount: 131,
                itemBuilder: (context, index) {
                  return Rutin(isEvery: true,title: '개쩌는 등 운동 루틴',heartCount: 2122,document: '등을 확실하게 조질 수 있습니다.',isHeart: false,name: "칼라피오리",image: 'assets/images/profile.png',);
                },
              );
            }

            //회원
            if (searchController.selector.value == 3) {
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Members(grade: 1,isFollow: false,name: "칼라피오리",images: 'assets/images/profile.png',);
                },
              );
            } else {
              return Center(child: Text('에러'),);
            }
          }),
        ),
      ],
    );
  }
}
