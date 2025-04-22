import 'package:calafi/components/profile.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Rutin extends StatefulWidget {
  final String image,name,title,document;
  final bool isHeart;
  final bool isEvery;
  final int heartCount;
  const Rutin({required this.isEvery,required this.document,required this.heartCount,required this.image,required this.isHeart, required this.name , required this.title,super.key});

  @override
  State<Rutin> createState() => _RutinState();
}

class _RutinState extends State<Rutin> {
  late bool isHeart;

  @override
  void initState() {
    isHeart=widget.isHeart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed('Rutin');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10,),
        decoration: BoxDecoration(
          border: widget.isEvery?Border(bottom: BorderSide(color: AppColor.gray300,width: 1)):Border(),
        ),
        child: Column(
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
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isHeart=!isHeart;
                        });
                      },
                      child: isHeart? SvgPicture.asset('assets/icon/heart/full.svg'):SvgPicture.asset('assets/icon/heart/empty.svg')
                    ),
                    SizedBox(height: 4,),
                    Text('${widget.heartCount}',style: AppTextStyles.R14.copyWith(color: AppColor.gray900),)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}