import 'package:calafi/api/ai/aiPost.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/routineComplete.dart';
import 'package:calafi/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}
class _ReportPageState extends State<ReportPage> {
  final userController = Get.find<UserController>();
  final routineController = Get.find<Routinecomplete>();
  final date = DateFormat('yyyy-MM-dd').format(DateTime.now().toUtc().add(Duration(hours: 9)));

  String text = '';
  bool isLoading = true; // 로딩 상태 추가

  @override
  void initState() {
    super.initState();
    print(routineController.worklist);
    getReport();
  }

  void getReport() async {
    int minite = (routineController.time.value / 60).floor();
    ActKcalPost actKcalPost = ActKcalPost(
      height: userController.height.value,
      weight: userController.weight.value,
      workoutTime: minite,
      workoutList: routineController.worklist.map((e) => e.toJson()).toList(),
    );
    text = await actKcalPost.sendWorkoutData();
    setState(() {
      isLoading = false;
    });
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
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView(
                      children: [
                        SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.gray50,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(() => Text(
                                      '${userController.name} 님의 운동 보고서',
                                      style: AppTextStyles.M16.copyWith(color: AppColor.gray900),
                                    )),
                                Text(
                                  date,
                                  style: AppTextStyles.M10.copyWith(color: AppColor.gray500),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.gray50,
                            ),
                            child: Text(
                              text,
                              style: AppTextStyles.R14.copyWith(color: AppColor.gray900),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            Footer(isClick: 1),
          ],
        ),
      ),
    );
  }
}
