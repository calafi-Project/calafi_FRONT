// import 'dart:ffi';

import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/routineComplete.dart';
import 'package:calafi/widgets/wave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePlay extends StatefulWidget {

  const HomePlay({super.key});

  @override
  State<HomePlay> createState() => _HomePlayState();
}

class _HomePlayState extends State<HomePlay> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  
  final routinecomplete = Get.find<Routinecomplete>();
  bool isCompolite=false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(); // 계속 반복
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.16),
              offset: Offset(0, 1),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('오늘의 루틴을 완성하세요',style: AppTextStyles.S18.copyWith(color: AppColor.gray900),),
            Text('성공을 향한 빌드업으로 오늘의 목표를 달성하세요',style: AppTextStyles.M12.copyWith(color: AppColor.gray400),),
            SizedBox(height: 18,),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center, // 중앙 정렬
                    children: [
                      Obx(()=>WaveWidget(
                        animation: animationController,
                        size: 100,
                        amplitude: 10,
                        position: 100-routinecomplete.percent.value.toDouble(),
                        color: AppColor.red,
                        style: WaveStyle.sin,
                      ),),
                      Obx(()=>WaveWidget(
                        animation: animationController,
                        size: 100,
                        amplitude: 15,
                        position:100-routinecomplete.percent.value.toDouble(),

                        color: AppColor.red.withOpacity(0.5),
                        style: WaveStyle.cos,
                      ),),
                      Obx(()=>Text(
                        '${routinecomplete.percent.value}%',
                        style: AppTextStyles.B30.copyWith(color: AppColor.gray900),
                      ),)
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      isCompolite?Image.asset('assets/images/complite.png'):GestureDetector(
                        onTap: (){
                          Get.toNamed('HomeRutin');
                        },
                        child: SvgPicture.asset('assets/icon/week/play.svg')
                      ),
                      SizedBox(height: 12,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColor.gray200,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: Text(isCompolite?'달성하셨습니다!':'0일 연속',style: AppTextStyles.M12.copyWith(color: AppColor.gray900),),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}