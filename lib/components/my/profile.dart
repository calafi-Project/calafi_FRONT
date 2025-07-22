import 'package:calafi/components/profile.dart';
import 'package:calafi/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyProfile extends StatelessWidget {
  final userController = Get.find<UserController>();
  MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
      },
      child: Stack(
        children: [
          Profile(image: '${userController.profileImage.value}', size: 60),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset('assets/icon/my/camera.svg'),
          )
        ],
      ),
    );
  }
}