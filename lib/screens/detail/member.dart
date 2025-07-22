import 'package:calafi/api/follow/follow.dart';
import 'package:calafi/api/follow/unfollow.dart';
import 'package:calafi/api/user/countFollow.dart';
import 'package:calafi/api/user/userOverrview.dart';
import 'package:calafi/components/exercise/video.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/components/member/counts.dart';
import 'package:calafi/components/member/profile.dart';
import 'package:calafi/components/member/selector.dart';
import 'package:calafi/components/search/rutin.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/models/user/getFollows.dart';
import 'package:calafi/models/user/getUserOverrviwe.dart';
import 'package:calafi/provider/sear.dart';
import 'package:calafi/provider/selector/member.dart';
import 'package:calafi/provider/token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  final memberController = Get.find<MemberController>();
  bool isSecret = false;
  final String? id = Get.parameters['id'];
  final bool? isFollow = bool.parse( Get.parameters['isfollow']!);
  final tokencontroller = Get.find<TokenController>();
  final searchController = Get.find<SearchModelController>();
  late UserOverview userData;
  late GetfollowsModel userCountData;
  bool isLoading = true;
  late bool isfollow;
  @override
  void initState() {
    super.initState();
    getUserOverview();
    isfollow=isFollow!;
  }

  void getUserOverview() async {
    final Useroverrview getUserApi = Useroverrview(
      id: int.parse(id!),
      token: tokencontroller.accessToken.value,
    );
    userData = await getUserApi.user_post();

    final countfollow = Countfollow(id: int.parse(id!));
    userCountData = await countfollow.user_get();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Header(),
                  // 프로필
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: AppColor.gray50),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                          child: Column(
                            children: [
                              MemberProfile(
                                isMy: false,
                                id: int.parse(id!),
                                folling: userCountData.followingCount,
                                follower: userCountData.followerCount,
                                grade: userData.userInfo.grade,
                                image: userData.userInfo.profileImage ??'assets/images/user.png',
                                name: userData.userInfo.name,
                              ),
                              SizedBox(height: 24),
                              GestureDetector(
                                onTap: () async{
                                  if(isfollow){
                                    //unfollow
                                    final UnFollowApi unFollowApi = UnFollowApi(followingId: int.parse(id!), token:  tokencontroller.accessToken.value);
                                    await unFollowApi.comment_post();
                                    
                                  }else{
                                    //follow
                                    final FollowApi followApi = FollowApi(follwingId: int.parse(id!), token: tokencontroller.accessToken.value);
                                    await followApi.comment_post();
                                  }
                                  if(searchController.searchText.value!=''){
                                    searchController.searchapi();
                                  }
                                  setState(() {
                                    isfollow=!isfollow;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        isfollow ? AppColor.blue : AppColor.red,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Center(
                                    child: Text(
                                      isfollow ? '팔로우 중' : '팔로우',
                                      style: AppTextStyles.S14
                                          .copyWith(color: AppColor.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        MemberCount(
                          calori: userData.userInfo.caloriBurned,
                          compleRoutine: userData.userInfo.completeRoutine,
                          workTime: userData.userInfo.workTime,
                        ),

                        MemberSelector(),

                        isSecret
                            ? Container(
                                padding: EdgeInsets.symmetric(vertical: 74),
                                child: Column(
                                  children: [
                                    SvgPicture.asset('assets/icon/secret.svg'),
                                    SizedBox(height: 24),
                                    Text(
                                      '비공개로 설정 되어있습니다.',
                                      style: AppTextStyles.M16
                                          .copyWith(color: AppColor.gray500),
                                    ),
                                  ],
                                ),
                              )
                            : Obx(() => SizedBox(
                                  height: 400,
                                  child: memberController.isSelector.value
                                      ? ListView.builder(
                                          itemCount: userData.routines.length,
                                          itemBuilder: (context, index) {
                                            final routine =
                                                userData.routines[index];
                                            return Rutin(
                                              isMy: true,
                                              id: routine.id,
                                              isEvery: true,
                                              title: routine.name,
                                              heartCount: routine.likes,
                                              document: routine.description,
                                              isHeart: routine.islike,
                                              name: userData.userInfo.name,
                                              image: userData
                                                      .userInfo.profileImage ??
                                                  'assets/images/user.png',
                                            );
                                          },
                                        )
                                      : ListView.builder(
                                          itemCount: userData.videos.length,
                                          itemBuilder: (context, index) {
                                            final video =
                                                userData.videos[index];
                                            return ExerciseVideo(
                                              videoUrl: video.videoUrl,
                                              isadd: true,
                                              image: userData
                                                      .userInfo.profileImage ??
                                                  'assets/images/exer.jpg',
                                              detail: video.title,
                                              title: video.title,
                                            );
                                          },
                                        ),
                                ))
                      ],
                    ),
                  ),
                  Footer(isClick: 0)
                ],
              ),
      ),
    );
  }
}
