import 'package:calafi/api/rutine/joinRoutine.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/noHaeder.dart';
import 'package:calafi/components/manage/days.dart';
import 'package:calafi/components/my/manageRutin.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/models/routine/weekRoutine.dart';
import 'package:calafi/provider/days/manage.dart';
import 'package:calafi/provider/token.dart';
import 'package:calafi/provider/user.dart';
import 'package:calafi/provider/weekRoutine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  final manageController = Get.put(ManageDaysController());
  final weekController = Get.find<WeekroutineController>();
  final usercontroller = Get.find<UserController>();
  final tokencontroller = Get.find<TokenController>();

  bool isLoading = true;
  List<WeekRoutineModel> weekData = [];

  @override
  void initState() {
    super.initState();
    getWeek();
  }

  void getWeek() async {
    setState(() => isLoading = true);

    await weekController.weekapi(manageController.GetClick());
    final Joinroutine joinroutine = Joinroutine(
      userId: usercontroller.id.value,
      token: tokencontroller.accessToken.value,
    );
    weekData = await joinroutine.Getroutine_post();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Nohaeder(),
            DaysManage(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Obx(() => Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            '${manageController.day} 루틴',
                            style: AppTextStyles.S18.copyWith(color: AppColor.gray900),
                          ),
                        )),
                    const SizedBox(height: 8),
                    Obx(() {
                      final routines = weekController.getFollowingData;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: routines.length,
                        itemBuilder: (context, index) {
                          final routine = routines[index];
                          return MyManageRuntin(
                            token: tokencontroller.accessToken.value,
                            id: routine.id,
                            isEvery: true,
                            isadd: false,
                            name: routine.authorName,
                            document: routine.description,
                            title: routine.name,
                            image: routine.authorProfile,
                          );
                        },
                      );
                    }),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('나의 루틴', style: AppTextStyles.S18),
                    ),
                    const SizedBox(height: 8),
                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: weekData.length,
                            itemBuilder: (context, index) {
                              final routine = weekData[index];
                              return MyManageRuntin(
                                token: tokencontroller.accessToken.value,
                                id: routine.id,
                                isEvery: true,
                                isadd: true,
                                name: routine.authorName,
                                document: routine.description,
                                title: routine.name,
                                image: routine.authorProfile,
                              );
                            },
                          ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            Footer(isClick: 3),
          ],
        ),
      ),
    );
  }
}
