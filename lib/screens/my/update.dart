import 'package:calafi/api/profile/myupdate.dart';
import 'package:calafi/components/button.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/components/my/inputUpdate.dart';
import 'package:calafi/components/my/profile.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/provider/token.dart';
import 'package:calafi/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyUpdatePage extends StatefulWidget {

  const MyUpdatePage({super.key});

  @override
  State<MyUpdatePage> createState() => _MyUpdatePageState();
}
class _MyUpdatePageState extends State<MyUpdatePage> {
  final tokenController = Get.find<TokenController>();
  final userController = Get.find<UserController>();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  bool isEmpty = true;

  @override
  void initState() {
    super.initState();
    weightController.addListener(_updateButtonState);
    heightController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      isEmpty = heightController.text.isEmpty || weightController.text.isEmpty;
    });
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 24),
                        MyProfile(),
                        SizedBox(height: 24),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                          decoration: BoxDecoration(
                            color: AppColor.gray100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Inputupdate(
                                controller: heightController,
                                hintText: '키를 입력하세요.',
                                title: '키',
                              ),
                              Inputupdate(
                                controller: weightController,
                                hintText: '몸무게를 입력하세요.',
                                title: '몸무게',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    GestureDetector(
                      onTap: () async{
                        if(!isEmpty){
                          try{
                            final myupdate = MyupdateApi(height: int.parse(heightController.text) ,weight:int.parse(weightController.text) ,token: tokenController.accessToken.value);
                            await myupdate.MyupdateApi_post();
                            userController.height.value=int.parse( heightController.text);
                            userController.weight.value=int.parse( weightController.text);
                            Get.toNamed('MyInfo');
                          }catch(error){
                            print(error);
                          }
                          
                        }
                      },
                      child: Button(state: !isEmpty, text: '완료')
                    ),
                  ],
                ),
              ),
            ),
            Footer(isClick: 4),
          ],
        ),
      ),
    );
  }
}
