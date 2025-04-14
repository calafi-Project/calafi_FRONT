import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Footer extends StatefulWidget {

  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int isClick = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
      decoration: BoxDecoration(
        color: AppColor.gray50,
        border: Border(top: BorderSide(color: AppColor.gray400,width: 1,))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                isClick=1;
              });
            },
            child: Column(
              children: [
                SvgPicture.asset(isClick==1?'assets/icon/footer/red/home.svg':'assets/icon/footer/home.svg'),
                SizedBox(height: 6,),
                Text('홈',style: AppTextStyles.M14.copyWith(color: isClick==1?AppColor.red:AppColor.gray400),)
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                isClick=2;
              });
            },
            child: Column(
              children: [
                SvgPicture.asset(isClick==2?'assets/icon/footer/red/search.svg':'assets/icon/footer/search.svg'),
                SizedBox(height: 6,),
                Text('검색',style: AppTextStyles.M14.copyWith(color: isClick==2?AppColor.red:AppColor.gray400),)
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                isClick=3;
              });
            },
            child: Column(
              children: [
                SvgPicture.asset(isClick==3?'assets/icon/footer/red/manage.svg':'assets/icon/footer/manage.svg'),
                SizedBox(height: 6,),
                Text('관리',style: AppTextStyles.M14.copyWith(color: isClick==3?AppColor.red:AppColor.gray400),)
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                isClick=4;
              });
            },
            child: Column(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isClick == 4 ? AppColor.red : AppColor.gray400,
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
                Text('MY',style: AppTextStyles.M14.copyWith(color: isClick==4?AppColor.red:AppColor.gray400),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}