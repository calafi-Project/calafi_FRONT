import 'package:calafi/components/profile.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class Exericseupload extends StatefulWidget {
  final String exerciseName;
  final List<String> exerciseTool;
  final String imageurl;
  const Exericseupload({required this.imageurl,required this.exerciseName,required this.exerciseTool, super.key});

  @override
  State<Exericseupload> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exericseupload> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Profile(image: widget.imageurl, size: 48),
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
        ],
      ),
    );
  }
}