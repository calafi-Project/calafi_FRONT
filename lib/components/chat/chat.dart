import 'package:calafi/api/exercise/getComment.dart';
import 'package:calafi/api/exercise/postComment.dart';
import 'package:calafi/api/rutine/getComment.dart';
import 'package:calafi/api/rutine/postComment.dart';
import 'package:calafi/components/chat/chatting.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/models/exercise/exerciseCommentModel.dart';
import 'package:calafi/provider/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Chat extends StatefulWidget {
  final String token;
  final int id;
  final bool isRorE;
  const Chat({required this.isRorE,required this.token, required this.id, super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final chatController = Get.find<ChatController>();
  final TextEditingController controller = TextEditingController();
  List<ExerciseComment> comments = [];
  @override
  void initState() {
    super.initState();
    fetchComments();
  }

  Future<void> fetchComments() async {
    if(widget.isRorE){
      try {
        final api = GetcommentExercise(
          exercise_id: widget.id,
          token: widget.token,
        );
        final result = await api.GetcommentExercise_post();
        setState(() {
          comments = result;
        });
      } catch (e) {
        print('댓글 불러오기 실패: $e');
      }
    }else{
      try {
        final api = GetcommentRoutine(
          exercise_id: widget.id,
          token: widget.token,
        );
        final result = await api.GetcommentRoutine_post();
        setState(() {
          comments = result;
        });
      } catch (e) {
        print('댓글 불러오기 실패: $e');
      }
    }

  }

  Future<void> postComment() async {
    if (controller.text.isEmpty) return;
    if(widget.isRorE){
      try {
        final postApi = exerciseCommentPost(
          exercise_id: widget.id,
          content: controller.text,
          token: widget.token,
        );
        await postApi.comment_post();
        controller.clear();
        await fetchComments(); // 댓글 다시 불러오기
      } catch (e) {
        print('댓글 작성 실패: $e');
      }
    }else{
      try {
        final postApi = RoutineCommentPost(
          routine_id: widget.id,
          content: controller.text,
          token: widget.token,
        );
        await postApi.comment_post();
        controller.clear();
        await fetchComments(); // 댓글 다시 불러오기
      } catch (e) {
        print('댓글 작성 실패: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
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
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        final chat = comments[index];
                        return Chatting(
                          name: chat.userName,
                          detail: chat.content,
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
                            controller: controller,
                            style: AppTextStyles.R16.copyWith(color: AppColor.gray900),
                            decoration: InputDecoration(
                              hintText: '댓글 달기...',
                              hintStyle: AppTextStyles.R16.copyWith(color: AppColor.gray400),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: postComment,
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
