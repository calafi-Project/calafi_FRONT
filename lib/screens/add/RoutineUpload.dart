import 'package:calafi/api/rutine/addRoutineToVideos.dart';
import 'package:calafi/api/rutine/addRutin.dart';
import 'package:calafi/api/rutine/routineVideo.dart';
import 'package:calafi/components/add/boardButton.dart';
import 'package:calafi/components/add/boardRutin.dart';
import 'package:calafi/components/add/inputAdd.dart';
import 'package:calafi/components/button.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/models/routine/routineDetails.dart';
import 'package:calafi/provider/add/video.dart';
import 'package:calafi/provider/token.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutineuploadPage extends StatefulWidget {
  const RoutineuploadPage({super.key});

  @override
  State<RoutineuploadPage> createState() => _RoutineuploadPageState();
}
class _RoutineuploadPageState extends State<RoutineuploadPage> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final TextEditingController tagcontroller = TextEditingController();

  final tokencontroller = Get.find<TokenController>();
  final exerciseUploadController = Get.put(VideoController());

  List<RoutineDetailVideos> getVideoData = [];
  bool isLoading = false;

  int id=0;

  @override
  void initState() {
    super.initState();
    namecontroller.text = exerciseUploadController.name.value;
    descriptioncontroller.text = exerciseUploadController.descript.value;
    tagcontroller.text = exerciseUploadController.tag.value;
    if (exerciseUploadController.videoIds.value.isNotEmpty) {
      getBoardRutine();
    }
  }

  void getBoardRutine() async {
    setState(() => isLoading = true);
    GetRoutineDetailVideo getRoutineDetailVideo = GetRoutineDetailVideo(
      ids: exerciseUploadController.videoIds.value,
      token: tokencontroller.accessToken.value,
    );
    getVideoData = await getRoutineDetailVideo.GetcommentRoutine_post();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    const SizedBox(height: 8),
                    Inputadd(controller: namecontroller, hint: '이름을 입력하세요.', text: '루틴 이름'),
                    Inputadd(controller: descriptioncontroller, hint: '설명을 입력하세요.', text: '루틴 설명'),
                    Inputadd(controller: tagcontroller, hint: '태그를 입력하세요.', text: '루틴 태그 ex) 덤밸, 매트'),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        exerciseUploadController.name.value = namecontroller.text;
                        exerciseUploadController.descript.value = descriptioncontroller.text;
                        exerciseUploadController.tag.value = tagcontroller.text;
                        Get.toNamed('AddVideo');
                      },
                      child: Boardbutton(icon: 'heart', text: '좋아요 한 목록'),
                    ),
                    const SizedBox(height: 20),
                    Text('목록', style: AppTextStyles.M14.copyWith(color: AppColor.gray900)),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: getVideoData.length * 80, // Boardrutin 높이 고려
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(), // 외부 ListView와 스크롤 충돌 방지
                        itemCount: getVideoData.length,
                        itemBuilder: (context, index) {
                          final video = getVideoData[index];
                          return Boardrutin(
                            image: video.videoUrl,
                            title: '${video.title} X ${exerciseUploadController.getCountByIndex(index)}',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () async {
                  if (namecontroller.text.isNotEmpty &&
                      descriptioncontroller.text.isNotEmpty &&
                      tagcontroller.text.isNotEmpty) {
                    AddRoutinePost addRoutinePost = AddRoutinePost(
                      name: namecontroller.text,
                      description: descriptioncontroller.text,
                      tags: tagcontroller.text,
                      token: tokencontroller.accessToken.value,
                    );
                    id = await addRoutinePost.routinePost();

                    Addroutinetovideos addroutinetovideos = Addroutinetovideos(count:exerciseUploadController.count.value,routineId: id,token: tokencontroller.accessToken.value,videoIds: exerciseUploadController.videoIds.value );
                    addroutinetovideos.routinePost();

                    exerciseUploadController.clear();

                    Get.toNamed('Success');
                  }
                },
                child: Button(state: true, text: '완료'),
              ),
            ),
            const SizedBox(height: 20),
            Footer(isClick: 0),
          ],
        ),
      ),
    );
  }
}
