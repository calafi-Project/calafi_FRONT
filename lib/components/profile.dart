import 'package:calafi/config/app_color.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String image;
  final double size;
  const Profile({required this.image,required this.size,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
          border: Border.all(
          color: AppColor.gray400,
          width: 1,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          image=="null"?'assets/images/user.png':image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}