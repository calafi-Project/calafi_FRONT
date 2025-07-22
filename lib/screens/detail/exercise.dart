import 'package:calafi/api/exercise/getExerciseDetail.dart';
import 'package:calafi/components/chat/chat.dart';
import 'package:calafi/components/chat/chatButton.dart';
import 'package:calafi/components/exercise/video.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/models/exercise/exerciseDetail.dart';
import 'package:calafi/provider/token.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  void initState() {
    super.initState();
    fetchExerciseDetail();
  }

  final String? id = Get.parameters['id'];
  final token = Get.find<TokenController>();

  late final Getexercisedetailapi api =
      Getexercisedetailapi(id: id!, token: token.accessToken.value);
  ExerciseDetail? exercisedetailModel;
  bool isLoading = true;

  void fetchExerciseDetail() async {
    final result = await api.Getexercisedetailapi_post();
    setState(() {
      exercisedetailModel = result;
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Header(),
                Expanded(
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ListView(
                          children: [
                            SizedBox(height: 40),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 운동 이름 + 설명
                                Column(
                                  children: [
                                    Text(
                                      exercisedetailModel!.name,
                                      style: AppTextStyles.M30,
                                    ),
                                    SizedBox(height: 12),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 20),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: AppColor.red),
                                        child: Center(
                                          child: Text(
                                            exercisedetailModel!.description,
                                            style: AppTextStyles.R16.copyWith(
                                                color: AppColor.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24),

                                // 필요 도구
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('필요 물품 : ',
                                              style: AppTextStyles.R16
                                                  .copyWith(color: AppColor.gray900)),
                                          ...exercisedetailModel!.need
                                              .split(',')
                                              .map((item) => Text(
                                                    '$item ',
                                                    style: AppTextStyles.R16.copyWith(
                                                        color: AppColor.red),
                                                  ))
                                              .toList(),
                                        ],
                                      ),
                                      SizedBox(height: 24),

                                      // 가이드
                                      Text('가이드',
                                          style: AppTextStyles.M20
                                              .copyWith(color: AppColor.gray900)),
                                      SizedBox(height: 8),
                                      Text(
                                        exercisedetailModel!.guide,
                                        style: AppTextStyles.R16
                                            .copyWith(color: AppColor.gray900),
                                      ),
                                      SizedBox(height: 24),

                                      // 영상
                                      Text('영상',
                                          style: AppTextStyles.M20
                                              .copyWith(color: AppColor.gray900)),
                                      SizedBox(height: 8),
                                    ],
                                  ),
                                ),

                                // 영상 리스트
                                SizedBox(
                                  height: 400,
                                  child: ListView.builder(
                                    itemCount: exercisedetailModel!.videos.length,
                                    itemBuilder: (context, index) {
                                      final video = exercisedetailModel!.videos[index];
                                      return ExerciseVideo(
                                        videoUrl: video.videoUrl,
                                        isadd: true,
                                        image: 'assets/images/exer.jpg',
                                        detail: video.title,
                                        title: video.creatorName,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
                Footer(isClick: 0),
              ],
            ),
            Chat(token: token.accessToken.value,isRorE: true,
              id: int.parse(id!),
            ),
            Chatbutton()
          ],
        ),
      ),
    );
  }
}
