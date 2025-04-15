import 'package:calafi/components/profile.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Exercise extends StatefulWidget {
  final bool isHeart;
  final String exerciseName;
  final List<String> exerciseTool;
  const Exercise({required this.exerciseName,required this.exerciseTool, required this.isHeart,super.key});

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  late bool isHeart;

  @override
  void initState() {
    isHeart=widget.isHeart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Profile(image: "assets/images/profile.png", size: 48),
              SizedBox(width: 14,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.exerciseName,style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                  Row(
                    children: [
                      for (int i = 0; i < widget.exerciseTool.length; i++) ...[
                        Text(
                          widget.exerciseTool[i],
                          style: AppTextStyles.R12.copyWith(color: AppColor.gray500),
                        ),
                        if (i != widget.exerciseTool.length - 1)
                          Text(
                            ', ',
                            style: AppTextStyles.R12.copyWith(color: AppColor.gray500),
                          ),
                      ]
                    ],
                  )
                ],
              )
            ],
          ),

          GestureDetector(
            onTap: (){
              setState(() {
                isHeart=!isHeart;
              });
            },
            child: isHeart?SvgPicture.asset('assets/icon/heart/full.svg'):SvgPicture.asset('assets/icon/heart/empty.svg')
          ),
        ],
      ),
    );
  }
}