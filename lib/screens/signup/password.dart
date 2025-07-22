import 'package:calafi/api/signUp/signUpApi.dart';
import 'package:calafi/components/button.dart';
import 'package:calafi/components/signUp/form.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUpPassword extends StatefulWidget {
  const SignUpPassword({super.key});

  @override
  State<SignUpPassword> createState() => _SignUpPasswordState();
}

class _SignUpPasswordState extends State<SignUpPassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  bool isOk = true;
  final signController = Get.find<SignController>();
  late bool result;
  late Signupapi sign;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icon/logo/big.svg'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '비밀번호를 입력해주세요',
                    style: AppTextStyles.M20.copyWith(color: AppColor.gray900),
                  ),
                  const SizedBox(height: 40),
                  Inputform(isCancel: false, controller: passwordController, text: '비밀번호'),
                  Inputform(isCancel: false, controller: repasswordController, text: '비밀번호 확인'),
                  if (!isOk)
                    Text(
                      '비밀번호가 서로 일치한지 확인해 주세요',
                      style: AppTextStyles.R12.copyWith(color: AppColor.red),
                    ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        isOk = passwordController.text == repasswordController.text;
                      });
          
                      if (isOk) {
                        if (passwordController.text.isNotEmpty) {
                          signController.password.value = passwordController.text;
          
                          sign = Signupapi(
                            age: signController.age.value,
                            height: signController.height.value,
                            name: signController.name.value,
                            password: signController.password.value,
                            weight: signController.weight.value,
                            email: signController.email.value,
                          );
          
                          result=await sign.Signup_post();
                          if(result){
                            Get.toNamed('/SignUpOk');
                          }
                        }
                      }
                    },
                    child: const Button(state: true, text: '다음'),
                  ),
                  const SizedBox(height: 20),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
