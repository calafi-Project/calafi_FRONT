import 'package:calafi/provider/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:calafi/components/chat/chatting.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:get/get.dart';

class Chat extends StatelessWidget {
  final chatController = Get.find<ChatController>();
  final List<List<String>> chats;

  Chat({required this.chats,super.key});
  
  @override
  Widget build(BuildContext context) {
    return Obx(()=> AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
      bottom: chatController.isOpen.value ? 0 : -400,
      left: 0,
      right: 0,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! > 10) {
            chatController.changeClose();
          } else if (details.primaryDelta! < -10) {
            chatController.changeOpen();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.gray50,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          height: 400,
          child: Column(
            children: [
              SizedBox(height: 12),
              SvgPicture.asset('assets/icon/slide.svg'),
              SizedBox(height: 8),
              Text('댓글', style: AppTextStyles.M14.copyWith(color: AppColor.gray900)),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    final chat = chats[index];
                    return Chatting(
                      detail: chat[1],
                      image: chat[2],
                      name: chat[0],
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: AppTextStyles.R16.copyWith(color: AppColor.gray900),
                        decoration: InputDecoration(
                          hintText: '댓글 달기...',
                          hintStyle: AppTextStyles.R16.copyWith(color: AppColor.gray400, letterSpacing: 0),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // 게시 버튼 클릭 시 처리 로직
                      },
                      child: Text('게시', style: AppTextStyles.R16.copyWith(color: AppColor.red)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}