import 'package:calafi/components/add/ererciseVideo.dart';
import 'package:calafi/components/add/inputAdd.dart';
import 'package:calafi/components/button.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/add/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddvideoPage extends StatefulWidget {
  const AddvideoPage({super.key});

  @override
  State<AddvideoPage> createState() => _AddvideoPageState();
}

class _AddvideoPageState extends State<AddvideoPage> {
  final TextEditingController controller = TextEditingController();
  final exerciseUploadController = Get.find<VideoController>();
  final TextEditingController countController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(child: Column(
        children: [
          Header(),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                      const SizedBox(height: 8),
                      Inputadd(controller: countController, hint: '반복 횟수를 입력하세요.', text: '반복 횟수'),
                      const SizedBox(height: 12),
                      Text(
                        '운동 이름',
                        style: AppTextStyles.M14.copyWith(color: AppColor.gray900),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColor.gray400, width: 1),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: controller,
                                style: AppTextStyles.R16.copyWith(color: AppColor.gray900),
                                decoration: InputDecoration(
                                  hintText: '검색할 영상 이름을 입력해주세요.',
                                  hintStyle: AppTextStyles.R16.copyWith(
                                    color: AppColor.gray400,
                                    letterSpacing: 0,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async{
                                exerciseUploadController.search(controller.text);
                              },
                              child: SvgPicture.asset('assets/icon/search.svg')),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Obx(()=>SizedBox(
                        height: 320,
                        child: ListView.builder(
                          itemCount: exerciseUploadController.exerciseData.length,
                          itemBuilder: (context, index) {
                            final exercise = exerciseUploadController.exerciseData[index];
                            return GestureDetector(
                              onTap: () {
                                exerciseUploadController.searchSelected.value = exercise.id;
                              },
                              child: ExerciseVideoBoard(
                                title: exercise.title,
                                id: exercise.id,
                              ),
                            );
                          },
                        ),
                      ),),
                      GestureDetector(
                        onTap: (){
                          exerciseUploadController.addCount(countController.text);
                          exerciseUploadController.addVideoId();
                          Get.toNamed('/RoutineUpload');
                        },
                        child: Button(state: true, text: '추가하기')
                      )
              ],
            ),
          )),
          Footer(isClick: 0)
        ],
      )),
    );
  }
}