import 'package:calafi/components/follow/selector.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/nameHeader.dart';
import 'package:calafi/components/member/follow.dart';
import 'package:calafi/components/search/members.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/provider/profile.dart';
import 'package:calafi/provider/selector/follow.dart';
import 'package:calafi/provider/token.dart';
import 'package:calafi/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowPage extends StatefulWidget {
  const FollowPage({super.key});

  @override
  State<FollowPage> createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {
  final followController = Get.find<FollowController>();
  final tokencontroller = Get.find<TokenController>();
  final poriflecontroller = Get.find<ProfileFollowController>();
  final userController = Get.find<UserController>();
  final String? id = Get.parameters['id'];
  final String? isMy = Get.parameters['isMy'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      poriflecontroller.fetchUserFollows(int.parse(id!), tokencontroller.accessToken.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Obx(() => NameHeader(text: userController.name.value)),
            Obx(() => FollowSelector(
                  follow: poriflecontroller.getFollowData.length,
                  following: poriflecontroller.getFollowingData.length,
                )),
            Expanded(
              child: Obx(() {
                if (poriflecontroller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                return followController.isSelector.value
                    ? ListView.builder(
                        itemCount: poriflecontroller.getFollowData.length,
                        itemBuilder: (context, index) {
                          final user = poriflecontroller.getFollowData[index];
                          return FollowDelete(
                            grade: user.grade,
                            name: user.name,
                            images: user.profileImage ?? 'null',
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: poriflecontroller.getFollowingData.length,
                        itemBuilder: (context, index) {
                          final user = poriflecontroller.getFollowingData[index];
                          return Members(
                            isMy: bool.parse(isMy!),
                            token: tokencontroller.accessToken.value,
                            id: user.id,
                            grade: user.grade,
                            isFollow: true,
                            name: user.name,
                            images: user.profileImage ?? 'null',
                          );
                        },
                      );
              }),
            ),
            const Footer(isClick: 0),
          ],
        ),
      ),
    );
  }
}
