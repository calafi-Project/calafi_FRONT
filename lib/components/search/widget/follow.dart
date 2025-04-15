import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/widgets.dart';

class FollowButton extends StatefulWidget {
  final bool isFollow;
  //유저 아이디를 받아서 api요청을 보내야함
  const FollowButton({required this.isFollow,super.key});

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  
  late bool isFollows;

  @override
  void initState() {
    isFollows=widget.isFollow;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isFollows=!isFollows;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isFollows?AppColor.blue:AppColor.red
        ),
        child: Text(isFollows?'팔로우 중':'팔로우',style: AppTextStyles.S14.copyWith(color: AppColor.white),),
      ),
    );
  }
}