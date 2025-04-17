import 'package:calafi/components/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
      },
      child: Stack(
        children: [
          Profile(image: 'assets/images/profile.png', size: 60),
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