import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Footer extends StatefulWidget {
  final int isClick;
  const Footer({required this.isClick,super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
      decoration: BoxDecoration(
        color: AppColor.gray50,
        border: Border(top: BorderSide(color: AppColor.gray200,width: 1,))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              Get.toNamed('Home');
            },
            child: Column(
              children: [
                SvgPicture.asset(widget.isClick==1?'assets/icon/footer/red/home.svg':'assets/icon/footer/home.svg'),
                SizedBox(height: 6,),
                Text('홈',style: AppTextStyles.M14.copyWith(color: widget.isClick==1?AppColor.red:AppColor.gray400),)
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
                Get.toNamed('Search');
            },
            child: Column(
              children: [
                SvgPicture.asset(widget.isClick==2?'assets/icon/footer/red/search.svg':'assets/icon/footer/search.svg'),
                SizedBox(height: 6,),
                Text('검색',style: AppTextStyles.M14.copyWith(color: widget.isClick==2?AppColor.red:AppColor.gray400),)
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Get.toNamed('Manage');
            },
            child: Column(
              children: [
                SvgPicture.asset(widget.isClick==3?'assets/icon/footer/red/manage.svg':'assets/icon/footer/manage.svg'),
                SizedBox(height: 6,),
                Text('관리',style: AppTextStyles.M14.copyWith(color: widget.isClick==3?AppColor.red:AppColor.gray400),)
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
                Get.toNamed('My');
            },
            child: Column(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.isClick == 4 ? AppColor.red : AppColor.gray400,
                      width: 1.5,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 6,),
                Text('MY',style: AppTextStyles.M14.copyWith(color: widget.isClick==4?AppColor.red:AppColor.gray400),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}