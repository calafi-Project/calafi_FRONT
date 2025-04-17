import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GrayButton extends StatefulWidget {
  final bool isOn;
  final String text;
  const GrayButton({required this.isOn,required this.text,super.key});

  @override
  State<GrayButton> createState() => _GrayButtonState();
}

class _GrayButtonState extends State<GrayButton> {
  bool isOn=false;

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
              onTap: (){
                setState(() {
                  isOn=!isOn;
                });
              },
              child: widget.isOn?isOn?SvgPicture.asset('assets/icon/my/red.svg'):SvgPicture.asset('assets/icon/my/blue.svg'):SizedBox())
          ],
        ),
      ),
    );
  }
}