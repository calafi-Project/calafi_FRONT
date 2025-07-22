import 'package:calafi/api/user/getUser.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/noHaeder.dart';
import 'package:calafi/components/home/home/board.dart';
import 'package:calafi/components/home/home/check.dart';
import 'package:calafi/components/home/home/play.dart';
import 'package:calafi/components/home/home/timeKcal.dart';
import 'package:calafi/components/home/home/water.dart';
import 'package:calafi/components/home/home/week.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/models/user/getUserModel.dart';
import 'package:calafi/provider/db/waterController.dart';
import 'package:calafi/provider/db/weekController.dart';
import 'package:calafi/provider/routineComplete.dart';
import 'package:calafi/provider/token.dart';
import 'package:calafi/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tokenController = Get.find<TokenController>();
  final userController = Get.find<UserController>();
  final waterController = Get.find<WaterController>();
  final weekcontroller = Get.find<ExerciseWeekController>();
  final routinecomplete = Get.find<Routinecomplete>();
  int totalSeconds=0;
  int hour=0;
  int minute=0;
  int second=0; 
  late UserModel userData;
  late GetuserApi getuserApi;
  @override
  void initState(){
    if( tokenController.accessToken.value.isNotEmpty){
      getUser();
    }
   
    super.initState();
  }

  void getUser() async {
    getuserApi = GetuserApi(token: tokenController.accessToken.value);
    userData = await getuserApi.user_get();
    userController.setUserActivity(userData);

    if(getKoreaWeekdayIndex==0){
      await weekcontroller.resetWeek();
    }

    await routinecomplete.getCount();

  }


  int getKoreaWeekdayIndex() {
    final now = DateTime.now().toUtc().add(Duration(hours: 9)); // 한국 시간 (UTC+9)
    int weekday = now.weekday; // Dart: 월=1 ~ 일=7

    // 월요일=0, ..., 일요일=6 로 변환
    return weekday == 7 ? 6 : weekday - 1;
  }

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
                  Obx(() => Week(state: weekcontroller.weekStates.toList())),

                  Obx(()=>Timekcal(
                    hour: routinecomplete.time.value ~/3600,
                    minute: (routinecomplete.time.value % 3600) ~/ 60,
                    second: routinecomplete.time.value % 60,
                    kcal: routinecomplete.time.value * 3,
                  ),),

                  HomePlay(),
                  Obx(() {
                    final data = waterController.waterData.value;
                    if (data == null) {
                      return const SizedBox(); // 혹은 로딩 위젯 등
                    }

                    return Water(
                      hope: data.goal,
                      now: data.total,
                    );
                  }),
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