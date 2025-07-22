import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/components/home/days.dart';
import 'package:calafi/components/home/homeRutin.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/days/homeRutin.dart';
import 'package:calafi/provider/weekRoutine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeRutinPage extends StatefulWidget {
  const HomeRutinPage({super.key});

  @override
  State<HomeRutinPage> createState() => _HomeRutinPageState();
}

class _HomeRutinPageState extends State<HomeRutinPage> {
  final homeRutinController = Get.find<HomeDayRutinController>();
  final weekController = Get.find<WeekroutineController>();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getWeek();
  }

  void getWeek() async {
    setState(() => isLoading = true);

    await weekController.weekapi(homeRutinController.GetClick());
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            DaysHome(),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 600,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Obx(()=>Text('${homeRutinController.day} 루틴',style: AppTextStyles.S18.copyWith(color: AppColor.gray900),)),
                        ),
                        Expanded(
                          child: isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : Obx(() {
                                  final data = weekController.getFollowingData;
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      final routine = data[index];
                                      return Homerutin(
                                        id: routine.id,
                                        isEvery: true,
                                        name: routine.authorName,
                                        document: routine.description,
                                        title: routine.name,
                                        image: routine.authorProfile,
                                      );
                                    },
                                  );
                                }),
                        ),
                      ],
                    ),
                  ),
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