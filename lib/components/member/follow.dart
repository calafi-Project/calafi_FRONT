import 'package:calafi/components/profile.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/util/getGrade.dart';
import 'package:flutter/material.dart';

class FollowDelete extends StatefulWidget {
  final String name,images;
  final int grade;
  const FollowDelete({required this.images,required this.grade,required this.name,super.key});


  @override
  State<FollowDelete> createState() => _FollowDeleteState();
}

class _FollowDeleteState extends State<FollowDelete> {
String grade='';

  @override
  void initState() {
    grade = getGrade(widget.grade);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Profile(image: widget.images, size: 48),
              SizedBox(width: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name,style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                  Text(grade,style: AppTextStyles.R12.copyWith(color: AppColor.gray500),)
                ],
              ),
            ],
          ),
          // GestureDetector(
          //   onTap: (){
              
          //   },
          //   child: Text('삭제',style: AppTextStyles.M14.copyWith(color: AppColor.red),)
          // )
        ],
      ),
    );
  }
}