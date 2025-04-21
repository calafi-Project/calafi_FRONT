import 'package:calafi/components/button.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/components/home/weight/body.dart';
import 'package:calafi/components/home/weight/chart.dart';
import 'package:calafi/components/home/weight/weight.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({super.key});

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Header(),
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
                    child: WeightChart(),
                  ),
                  SizedBox(height: 12,),
                  BodyState(),
                  SizedBox(height: 10,),
                  Text('오늘의 몸무게',style: AppTextStyles.M18.copyWith(color: AppColor.gray900),),
                  SizedBox(height: 10,),
                  WeightInput(controller: controller),
                  SizedBox(height: 20,),
                  Button(state: true, text: '기록하기')
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