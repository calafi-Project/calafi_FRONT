import 'package:calafi/components/button.dart';
import 'package:calafi/components/signUp/form.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpName extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final signController = Get.find<SignController>();
  SignUpName({super.key});

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
                      Text('이름을 입력해주세요',style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                      SizedBox(height: 40,),
                      Inputform(isCancel: true, controller: nameController, text: '이름'),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          if(nameController.text.isNotEmpty){
                            signController.name.value=nameController.text;
                            print(signController.name.value);
                            Get.toNamed('/SignUpEmail');
                          }
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