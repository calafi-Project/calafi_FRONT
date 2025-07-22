import 'package:calafi/components/exercise/VideoPlayScreen.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class ExerciseVideo extends StatelessWidget {
  final String image,title,detail;
  final String videoUrl;

  final bool isadd;

  const ExerciseVideo({
    required this.isadd,
    required this.image,
    required this.detail,
    required this.title,
    required this.videoUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VideoPlayScreen(videoUrl: videoUrl),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColor.gray300,width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Image.asset(
                    'assets/images/exer.jpg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),)),
      
                SizedBox(width: 8,),
      
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: AppTextStyles.R14.copyWith(color: AppColor.gray600),),
                    SizedBox(height: 4,),
                    Text(detail,style: AppTextStyles.R14.copyWith(color: AppColor.gray900),),
                  ],
                ),
              ],
            ),
            // isadd?
            // Container(
            //   decoration: BoxDecoration(
            //     color: AppColor.gray100,
            //     borderRadius: BorderRadius.circular(4)
            //   ),
            //   padding: EdgeInsets.all(7),
            //   child: SvgPicture.asset('assets/icon/add.svg'),
            // ):SizedBox()
      
          ],
        ),
      ),
    );
  }
}

