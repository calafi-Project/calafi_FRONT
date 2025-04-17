import 'package:calafi/components/profile.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class MyManageRuntin extends StatefulWidget {
  final String image,name,title,document;
  final bool isadd;
  final bool isEvery;
  const MyManageRuntin({required this.isEvery,required this.document,required this.image,required this.isadd, required this.name , required this.title,super.key});

  @override
  State<MyManageRuntin> createState() => _MyManageRuntinState();
}

class _MyManageRuntinState extends State<MyManageRuntin> {
  late bool isadd;

  @override
  void initState() {
    isadd=widget.isadd;
    super.initState();
  }

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
              //추가 삭제 로직
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.gray100
              ),
              width: 26,
              height: 26,
              child: Center(child:isadd? SvgPicture.asset('assets/icon/add.svg'):SvgPicture.asset('assets/icon/minus.svg')),
            ),
          )
        ],
      ),
    );
  }
}


