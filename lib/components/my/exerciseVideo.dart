import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class ExercisevideoDelete extends StatelessWidget {
  final String image,title,detail;
  const ExercisevideoDelete({required this.image,required this.detail,required this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColor.gray300,width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
      
          SizedBox(width: 8,),
      
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: AppTextStyles.R14.copyWith(color: AppColor.gray600),),
              SizedBox(height: 4,),
              Text(detail,style: AppTextStyles.R14.copyWith(color: AppColor.gray900),),
            ],
          ),
        ],
      ),
    );
  }
}