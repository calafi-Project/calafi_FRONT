import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/add/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ExerciseVideoBoard extends StatefulWidget {
  final String title;
  final int id;
  const ExerciseVideoBoard({required this.id,required this.title,super.key});

  @override
  State<ExerciseVideoBoard> createState() => _ExerciseVideoBoardState();
}

class _ExerciseVideoBoardState extends State<ExerciseVideoBoard> {
  bool isOk=false;
  final exerciseUploadController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColor.gray300,width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 8,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,style: AppTextStyles.R14.copyWith(color: AppColor.gray600),),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              exerciseUploadController.searchSelected.value = widget.id;
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.gray100,
                borderRadius: BorderRadius.circular(4)
              ),
              padding: EdgeInsets.all(7),
              child: Obx(()=>SvgPicture.asset(exerciseUploadController.searchSelected.value == widget.id? 'assets/icon/ok.svg':'assets/icon/add.svg'),)
            ),
          )
        ],
      ),
    );
  }
}

