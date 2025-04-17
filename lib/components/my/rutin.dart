import 'package:calafi/components/profile.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class RutinDelete extends StatelessWidget {
  final String image,name,title,document;
  final bool isEvery;
  const RutinDelete({required this.isEvery,required this.document,required this.image,required this.name , required this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10,),
      decoration: BoxDecoration(
        border: isEvery?Border(bottom: BorderSide(color: AppColor.gray300,width: 1)):Border(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Profile(image: image, size: 24),
              SizedBox(width: 8,),
              Text(name,style: AppTextStyles.R14.copyWith(color: AppColor.gray600),)
            ],
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: AppTextStyles.M16.copyWith(color: AppColor.gray900),),
                  Text(document,style: AppTextStyles.R14.copyWith(color: AppColor.gray500),)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}