import 'package:calafi/components/button.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SucessPage extends StatelessWidget {
  const SucessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 60,),
                      SvgPicture.asset('assets/icon/logo/big.svg'),
                      SizedBox(height: 12,),
                      Text('성공적으로 작업이 완료 되었습니다.',style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                      SizedBox(height: 24,),
                      
                    ],
                  )
                ],
              )),
              Image.asset('assets/images/success.png'),
              GestureDetector(
                onTap: (){
                  Get.toNamed('Home');
                },
                child: Button(state: true, text: '넘어가기')),
              SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}