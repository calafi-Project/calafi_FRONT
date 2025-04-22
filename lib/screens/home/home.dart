import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/noHaeder.dart';
import 'package:calafi/components/home/home/board.dart';
import 'package:calafi/components/home/home/check.dart';
import 'package:calafi/components/home/home/play.dart';
import 'package:calafi/components/home/home/timeKcal.dart';
import 'package:calafi/components/home/home/water.dart';
import 'package:calafi/components/home/home/week.dart';
import 'package:calafi/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Nohaeder(),
            Expanded(
              child: ListView(
                children: [
                  Week(state: [1,2,1,2,3,2,1],),
                  Timekcal(hour: 2, kcal:1233, minute:20, second: 23),
                  HomePlay(),
                  Water(hope: 1550,now: 120,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                    child: Row(
                      children: [
                        Expanded(child: GestureDetector(
                          onTap: (){
                            Get.toNamed('Report');
                          },
                          child: Board())
                        ),
                        SizedBox(width: 12,),
                        Expanded(child: GestureDetector(
                          onTap: (){
                            Get.toNamed('Weight');
                          },
                          child: Check())
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Footer(isClick: 1)
          ],
        ),
      ),
    );
  }
}