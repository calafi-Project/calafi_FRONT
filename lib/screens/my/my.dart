import 'package:calafi/api/user/createExerciseRoutine.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/setHeader.dart';
import 'package:calafi/components/member/counts.dart';
import 'package:calafi/components/member/profile.dart';
import 'package:calafi/components/member/selector.dart';
import 'package:calafi/components/my/exerciseVideo.dart';
import 'package:calafi/components/my/rutin.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/models/user/getCreate.dart';
import 'package:calafi/provider/profile.dart';
import 'package:calafi/provider/selector/member.dart';
import 'package:calafi/provider/token.dart';
import 'package:calafi/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyPage extends StatefulWidget {

  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}class _MyPageState extends State<MyPage> {
  final userController = Get.find<UserController>();
  final memberController = Get.find<MemberController>();
  final tokenController = Get.find<TokenController>();
  final poriflecontroller = Get.find<ProfileFollowController>();

  CreateUser? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getFollowers();
  }

  void getFollowers() async {
    poriflecontroller.fetchUserCount(userController.id.value);
    GetCreateUser createExerciseVideo = GetCreateUser(token: tokenController.accessToken.value);
    final userInfo = await createExerciseVideo.create_get();
    setState(() {
      userData = userInfo;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Stack(
                children: [
                  Column(
                    children: [
                      SetHeader(),
                      Expanded(
                        child: isLoading || userData == null
                        ? const Center(child: CircularProgressIndicator())
                        :  ListView(
                          children: [
                            Container(
                              decoration: BoxDecoration(color: AppColor.gray50),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                              child: Obx(()=>MemberProfile(
                                isMy: true,
                                id: userController.id.value,
                                folling: poriflecontroller.getCountData.value!.followingCount,
                                follower: poriflecontroller.getCountData.value!.followerCount,
                                grade: userController.grade.value,
                                image: '${userController.profileImage.value}',
                                name: userController.name.value,
                              ),)
                            ),
                            MemberCount(
                              calori: userController.caloriBurned.value,
                              compleRoutine: userController.completeRoutine.value,
                              workTime: userController.workTime.value,
                            ),
                            MemberSelector(),
                            Obx(
                              () => SizedBox(
                                height: 400,
                                child: memberController.isSelector.value
                                    ? ListView(
                                        children: userData!.routines.map((routine) {
                                          return RutinDelete(
                                            id: routine.id,
                                            isEvery: true,
                                            title: routine.name,
                                            document: routine.description,
                                            name: userController.name.value,
                                            image: userController.profileImage.value ?? 'null',
                                          );
                                        }).toList(),
                                      )
                                    : ListView(
                                        children: userData!.videos.map((video) {
                                          return ExercisevideoDelete(
                                            id: video.id,
                                            // image: video.videourl ?? '',
                                            image: 'assets/images/exer.jpg',
                                            detail: video.title,
                                            title: userController.name.value,
                                          );
                                        }).toList(),
                                      ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Footer(isClick: 4),
                    ],
                  ),
                  Positioned(
                    right: 12,
                    bottom: 120,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('AddBoard');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(11),
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.gray200,
                        ),
                        child: SvgPicture.asset('assets/icon/add.svg'),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
