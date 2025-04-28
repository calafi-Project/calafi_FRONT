import 'package:calafi/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  final bool isAlram=false;
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.gray50
      ),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: SvgPicture.asset('assets/icon/back.svg')
          ),
          GestureDetector(
            onTap: (){
              Get.toNamed('Alram');
            },
            child: isAlram?SvgPicture.asset('assets/icon/fullalram.svg'):SvgPicture.asset('assets/icon/alram.svg')
          )
        ],
      ),
    );
  }
}