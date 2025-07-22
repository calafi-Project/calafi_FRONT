import 'package:calafi/api/user/isroutineUpdate.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/token.dart';
import 'package:calafi/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GrayButton extends StatefulWidget {
  final bool isOn;
  final String text;
  final int isWork;
  const GrayButton({this.isWork=2,required this.isOn,required this.text,super.key});

  @override
  State<GrayButton> createState() => _GrayButtonState();
}

class _GrayButtonState extends State<GrayButton> {
  final userController = Get.find<UserController>();
  final tokenController = Get.find<TokenController>();
   bool isOn=false;
  @override
  void initState() {
    if(widget.isWork==0){
      if(userController.isRoutine.value==0){
        isOn=false;
      }
      else if(userController.isRoutine.value==1){
        isOn=true;
      } 
    }
    else if(widget.isWork==1){
            if(userController.isWorkout.value==0){
        isOn=false;
      }
      else if(userController.isWorkout.value==1){
        isOn=true;
      } 
    }
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13,horizontal: 14),
        decoration: BoxDecoration(
          color: AppColor.gray100,
          borderRadius: BorderRadius.circular(4)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.text,style: AppTextStyles.M16.copyWith(color: AppColor.gray900),),

            GestureDetector(
              onTap: () async{
                setState(() {
                  isOn=!isOn;
                });
                if(widget.isWork==0){
                    final isroutine = IsRoutineUpdate(token: tokenController.accessToken.value);
                    isroutine.Update_Post(); 
                  }
                  else if(widget.isWork==1){
                    final isWork = IsRoutineUpdate(token: tokenController.accessToken.value);
                    isWork.Update_Post(); 
                  }
              },
              child: widget.isOn?isOn?SvgPicture.asset('assets/icon/my/red.svg'):SvgPicture.asset('assets/icon/my/blue.svg'):SizedBox())
          ],
        ),
      ),
    );
  }
}