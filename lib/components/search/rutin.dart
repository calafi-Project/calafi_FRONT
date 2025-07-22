import 'package:calafi/api/rutine/like.dart';
import 'package:calafi/api/rutine/unlike.dart';
import 'package:calafi/components/profile.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/sear.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Rutin extends StatefulWidget {
  final String token;
  final String image,name,title,document;
  final bool isHeart;
  final bool isEvery;
  final bool isMy;
  final int id;
  final int heartCount;
  const Rutin({required this.isMy,this.token="",required this.id,required this.isEvery,required this.document,required this.heartCount,required this.image,required this.isHeart, required this.name , required this.title,super.key});

  @override
  State<Rutin> createState() => _RutinState();
}

class _RutinState extends State<Rutin> {
  final getSearchController = Get.find<SearchModelController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed('Rutin',parameters: {'id': '${widget.id}',"heart":'${widget.isHeart}'});
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
                !widget.isMy?Column(
                  children: [
                    GestureDetector(
                      onTap: () async{
                          if(widget.isHeart==true){
                            //unlike
                            final unlike = UnlikePost(routineId: widget.id, token: widget.token);
                            await unlike.unlike_post();
                          }
                          else{
                            //like
                            final like = LikePost(routineId: widget.id, token: widget.token);
                            await like.like_post();
                          }
                          getSearchController.searchapi();
                      },
                      child: widget.isHeart? SvgPicture.asset('assets/icon/heart/full.svg'):SvgPicture.asset('assets/icon/heart/empty.svg')
                    ),
                    SizedBox(height: 4,),
                    Text('${widget.heartCount}',style: AppTextStyles.R14.copyWith(color: AppColor.gray900),)
                  ],
                ):SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}