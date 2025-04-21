import 'package:calafi/components/profile.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class Homerutin extends StatefulWidget {
  final String image,name,title,document;
  final bool isEvery;
  const Homerutin({required this.isEvery,required this.document,required this.image, required this.name , required this.title,super.key});

  @override
  State<Homerutin> createState() => _HomerutinState();
}

class _HomerutinState extends State<Homerutin> {
  late bool isadd;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10,),
      decoration: BoxDecoration(
        border: widget.isEvery?Border(bottom: BorderSide(color: AppColor.gray300,width: 1)):Border(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Profile(image: widget.image, size: 24),
                  SizedBox(width: 8,),
                  Text(widget.name,style: AppTextStyles.R14.copyWith(color: AppColor.gray600),)
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title,style: AppTextStyles.M16.copyWith(color: AppColor.gray900),),
                      Text(widget.document,style: AppTextStyles.R14.copyWith(color: AppColor.gray500),)
                    ],
                  ),
                  
                ],
              )
            ],
          ),
          GestureDetector(
            onTap: (){
              
            },
            child: SvgPicture.asset('assets/icon/play.svg')
          )
        ],
      ),
    );
  }
}


