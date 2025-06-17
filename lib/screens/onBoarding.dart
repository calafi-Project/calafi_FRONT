import 'package:calafi/components/button.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';


class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100,),
                      Text('목표를\n향한 빌드업',style: AppTextStyles.R32.copyWith(color: AppColor.gray900,height: 1.2),),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/icon/logo/big.svg'),
                          SizedBox(width: 4,),
                        ],
                      ),
                    ],
                  ),
                   Column(
                     children: [
                       GestureDetector(
                        onTap: (){
                          Get.toNamed('/SignUpName');
                        },
                        child: Button(state: true, text: '회원가입')
                      ),
                       SizedBox(height: 14,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('이미 회원 가입을 했다면? ',style: AppTextStyles.R12.copyWith(color: AppColor.gray900),),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed('/Login');
                            },
                            child: Text('로그인 ',style: AppTextStyles.B12.copyWith(color: AppColor.gray900),)),
                        ],
                       ),
                       SizedBox(height: 30,),
                     ],
                   ),
                ],
              ),
            )
      ),
    );
  }
}