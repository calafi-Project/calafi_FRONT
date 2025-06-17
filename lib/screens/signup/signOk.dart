import 'package:calafi/components/button.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUpOk extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final signController = Get.find<SignController>();
  SignUpOk({super.key});

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icon/logo/big.svg'),
                        ],
                      ),
                      SizedBox(height: 24,),
                      Obx(() =>
                        Text('${signController.name.value}님,\n회원가입이 완료되었습니다.',style: AppTextStyles.M24.copyWith(color: AppColor.gray900),),
                      ),
                      Text('앞으로의 빌드업은 저희가 함께하겠습니다.\n로그인을 완료해주세요.',style: AppTextStyles.R20.copyWith(color: AppColor.gray900),),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.toNamed('/Login');
                        },
                        child: Button(state: true, text: '다음')),
                      SizedBox(height: 20,)
                    ],
                  )
                ],
              ),
            )
      ),
    );
  }
}