import 'package:calafi/components/button.dart';
import 'package:calafi/components/signUp/form.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class SignUpEmail extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final signController = Get.find<SignController>();
  SignUpEmail({super.key});

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
                      Text('이메일을 입력해주세요',style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                      SizedBox(height: 8,),
                      Text('구글 이메일만 사용가능합니다.',style: AppTextStyles.M16.copyWith(color: AppColor.blue),),
                      SizedBox(height: 40,),
                      Inputform(isCancel: true, controller: emailController, text: '이메일'),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (emailController.text.isNotEmpty &&
                              emailController.text.contains('@') &&
                              emailController.text.split('@').last == 'gmail.com') {
                            signController.email.value = emailController.text;
                            print(signController.email.value);
                            Get.toNamed('/SignUpAge');
                          }
                        },
                        child: Button(state: true, text: '다음')
                      ),
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