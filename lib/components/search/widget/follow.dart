import 'package:calafi/api/follow/follow.dart';
import 'package:calafi/api/follow/unfollow.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/profile.dart';
import 'package:calafi/provider/sear.dart';
import 'package:calafi/provider/user.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FollowButton extends StatefulWidget {
  final bool isFollow;
  final int id;
  final String token;
  final bool isMy;
  
  const FollowButton({required this.isMy,required this.token,required this.id,required this.isFollow,super.key});

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  final searchController = Get.find<SearchModelController>();
  final poriflecontroller = Get.find<ProfileFollowController>();
  final usercontroller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        if(widget.isFollow){
          final UnFollowApi unFollowApi = UnFollowApi(followingId: widget.id, token: widget.token);
          await unFollowApi.comment_post();
          }else{
            final FollowApi followApi = FollowApi(follwingId: widget.id, token: widget.token);
            await followApi.comment_post();
          }
          if(searchController.searchText.value!=''){
            searchController.searchapi();
          }
          if(widget.isMy==true){
            poriflecontroller.fetchUserFollows(usercontroller.id.value, widget.token);
            poriflecontroller.fetchUserCount(usercontroller.id.value);
          }
          else if(widget.isMy==false){
            poriflecontroller.fetchUserFollows(widget.id, widget.token);
            poriflecontroller.fetchUserCount(widget.id);
          }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: widget.isFollow?AppColor.blue:AppColor.red
        ),
        child: Text(widget.isFollow?'팔로우 중':'팔로우',style: AppTextStyles.S14.copyWith(color: AppColor.white),),
      ),
    );
  }
}