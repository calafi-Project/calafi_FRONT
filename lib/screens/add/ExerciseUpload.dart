import 'package:calafi/api/upload/exerciseVedio.dart';
import 'package:calafi/components/add/exericseUpload.dart';
import 'package:calafi/components/button.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/add/exerciseUpload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ExerciseuploadPage extends StatefulWidget {
  const ExerciseuploadPage({super.key});

  @override
  State<ExerciseuploadPage> createState() => _ExerciseuploadPageState();
}

class _ExerciseuploadPageState extends State<ExerciseuploadPage> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController titlecontroller = TextEditingController();
  final exerciseUploadController = Get.put(ExerciseuploadController());
  final ImagePicker picker = ImagePicker();
  XFile? pickedVideo;
  late bool isOks;
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
                    const SizedBox(height: 24),
                    
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
                                hintText: '업로드할 운동의 이름을 입력해주세요.',
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
                      height: 280,
                      child: ListView.builder(
                        itemCount: exerciseUploadController.exerciseData.length,
                        itemBuilder: (context, index) {
                          final exercise = exerciseUploadController.exerciseData[index];
                          return GestureDetector(
                            onTap: () {
                              exerciseUploadController.searchSelected.value = exercise.id;
                              controller.text=exercise.name;
                            },
                            child: Exericseupload(
                              imageurl: exercise.imageurl,
                              exerciseName: exercise.name,
                              exerciseTool: [exercise.need],
                            ),
                          );
                        },
                      ),
                    ),),
                    const SizedBox(height: 8),
                    Text(
                      '제목',
                      style: AppTextStyles.M14.copyWith(color: AppColor.gray900),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColor.gray400, width: 1),
                      ),
                      child: TextFormField(
                        controller: titlecontroller,
                        style: AppTextStyles.R16.copyWith(color: AppColor.gray900),
                        decoration: InputDecoration(
                          hintText: '운동 영상의 제목을 입력해주세요.',
                          hintStyle: AppTextStyles.R16.copyWith(
                            color: AppColor.gray400,
                            letterSpacing: 0,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () async {
                        try{
                          pickedVideo = await picker.pickVideo(source: ImageSource.gallery);
                          if (pickedVideo != null) {
                            setState(() {});  // 화면 갱신
                            print('선택한 영상 경로: ${pickedVideo!.path}');
                          }
                        }catch(err){
                          print('시뮬레이터 환경이 아닙니다');
                        }

                      },
                      child: Button(state: true, text: '영상 업로드'),
                    ),
                    SizedBox(height: 40,),
                    GestureDetector(
                      onTap: (){
                        
                        if(pickedVideo != null){
                          final ExercisevedioPost exercisevedioPost = ExercisevedioPost(exerciseid: exerciseUploadController.searchSelected.value, token: exerciseUploadController.tokenController.accessToken.value, title: titlecontroller.text, videourl: pickedVideo!);
                          
                          setState(() async{
                            isOks = await exercisevedioPost.exerciseVideoPost();
                          });
                          
                        }
                        if(isOks){
                          Get.toNamed('Success');
                        }
                      },
                      child: Button(state: true, text: '완료'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),
            Footer(isClick: 0),
          ],
        ),
      ),
    );
  }
}
