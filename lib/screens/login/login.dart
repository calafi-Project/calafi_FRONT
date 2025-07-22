import 'package:calafi/api/login/loginApi.dart';
import 'package:calafi/components/button.dart';
import 'package:calafi/components/signUp/form.dart';
import 'package:calafi/components/signUp/text.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/models/accessToken.dart';
import 'package:calafi/provider/auth.dart';
import 'package:calafi/provider/token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isOk = true;
  bool isEmpty = false;
  final authController = Get.find<AuthController>();

  late Accesstoken result;
  late Loginapi login;

  @override
  void initState() {
    super.initState();
    emailcontroller.addListener(_checkEmpty);
    passwordcontroller.addListener(_checkEmpty);
  }

  void _checkEmpty() {
    final isNotEmpty = emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty;
    if (isEmpty != isNotEmpty) {
      setState(() {
        isEmpty = isNotEmpty;
      });
    }
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokenController = Get.find<TokenController>();

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
                      SizedBox(height: 50,),
                      Inputform(isCancel: true, controller: emailcontroller, text: '이메일@gmail.com'),
                      Inputform(isCancel: false, controller: passwordcontroller, text: '비밀번호'),
                    ],
                  ),
                   Column(
                     children: [
                      isOk?SizedBox():Text('맞는 이메일과 비밀번호가 존재 하지 않습니다.',style: AppTextStyles.R12.copyWith(color: AppColor.red),),
              
                      SizedBox(height: 30,),
                       isEmpty?
                       GestureDetector(
                        onTap: () async{
                          login = Loginapi(email: emailcontroller.text,password: passwordcontroller.text);
                          result = await login.Login_post();
                          if(result.accessToken.isNotEmpty){
                            await authController.saveToken(result.accessToken);
                            tokenController.accessToken.value = result.accessToken;
                            Get.toNamed('/Home');
                          }
                        },
                        child: Button(state: true, text: '로그인')
                      ):
                       Button(state: false, text: '로그인'),
                       SizedBox(height: 14,),
                       Text('로그인하시면 아래 내용에 동의하는 것으로 간주됩니다.',style: AppTextStyles.R12.copyWith(color: AppColor.gray400),),
                       SizedBox(height: 4,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUnder(text: '개인정보 처리 방침'),
                          SizedBox(width: 24,),
                          TextUnder(text: '이용약관'),
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