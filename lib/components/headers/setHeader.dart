import 'package:calafi/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SetHeader extends StatelessWidget {
  const SetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.gray50
      ),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: (){
              Get.toNamed('MySet');
            },
            child: SvgPicture.asset('assets/icon/set.svg'))
        ],
      ),
    );
  }
}