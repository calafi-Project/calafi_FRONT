import 'package:calafi/components/follow/selector.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/nameHeader.dart';
import 'package:calafi/components/member/follow.dart';
import 'package:calafi/components/search/members.dart';
import 'package:calafi/provider/selector/follow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FollowPage extends StatefulWidget {
  const FollowPage({super.key});

  @override
  State<FollowPage> createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {
  final followController = Get.find<FollowController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            NameHeader(text: '킴펨베'),
            FollowSelector(follow: 1, following: 12),
            Expanded(child: Obx(()=>followController.isSelector.value?ListView.builder(
              itemCount: 131,
              itemBuilder: (context, index) {
                return FollowDelete(grade: 1,name: "칼라피오리",images: 'assets/images/profile.png',);
              },
            ):
            ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return Members(grade: 1,isFollow: true,name: "칼라피오리",images: 'assets/images/profile.png',);
              },
            ))),
            Footer()
          ],
        ),
      ),
    );
  }
}