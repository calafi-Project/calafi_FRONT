import 'package:calafi/config/app_color.dart';
import 'package:calafi/provider/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Chatbutton extends StatelessWidget {
  final chatController = Get.find<ChatController>();
  Chatbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>chatController.isOpen.value?SizedBox():Positioned(
              bottom: 70,
              right: 12,
              child: GestureDetector(
                onTap: (){
                  chatController.changeOpen();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColor.blue,
                    shape: BoxShape.circle
                  ),
                  child: SvgPicture.asset('assets/icon/chat.svg')
                ),
              ),
            ));
  }
}