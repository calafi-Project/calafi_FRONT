import 'package:calafi/api/profile/myupdate.dart';
import 'package:calafi/components/button.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/components/home/weight/body.dart';
import 'package:calafi/components/home/weight/chart.dart';
import 'package:calafi/components/home/weight/weight.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/db/weightController.dart';
import 'package:calafi/provider/token.dart';
import 'package:calafi/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({super.key});

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  TextEditingController controller = TextEditingController();
  final weightcontroller = Get.find<WeightController>();
  final usercontroller = Get.find<UserController>();
  final tokenController = Get.find<TokenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 12,),
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColor.gray,width: 1)
                    ),
                    height: 180,
                    child:Obx(() {
                      final weights = weightcontroller.weights;
                      if ( weights.isEmpty) {
                        return Center(child: Text('데이터 없음'));
                      }
                      return WeightChart(
                        weights: weightcontroller.weightValues,
                        dates: weightcontroller.weightDates,
                        targetWeight: 64,
                      );
                    })
                  ),
                  SizedBox(height: 12,),
                  Obx(()=>BodyState(
                    age: usercontroller.age.value,
                    height: usercontroller.height.value,
                    weight: usercontroller.weight.value,
                    isMale: true,
                  ),),
        
                  SizedBox(height: 10,),
                  Text('오늘의 몸무게',style: AppTextStyles.M18.copyWith(color: AppColor.gray900),),
                  SizedBox(height: 10,),
                  WeightInput(controller: controller),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () async{
                      final myupdate = MyupdateApi(height: usercontroller.height.value ,weight:int.parse(controller.text) ,token: tokenController.accessToken.value);
                      await myupdate.MyupdateApi_post();
                      usercontroller.weight.value=int.parse( controller.text);
                      final weight = double.tryParse(controller.text);
                      if (weight != null) {
                        await weightcontroller.saveWeight(weight);
                        controller.clear();
                      } else {
                        Get.snackbar('입력 오류', '올바른 몸무게를 입력하세요');
                      }
                    },
                    child: Button(state: true, text: '기록하기'))
                ],
              ),
            )),
            Footer(isClick: 1)
          ],
        ),
      ),
    );
  }
}