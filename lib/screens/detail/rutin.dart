import 'package:calafi/api/rutine/getRoutine.dart';
import 'package:calafi/api/rutine/getRoutineDetail.dart';
import 'package:calafi/api/rutine/like.dart';
import 'package:calafi/api/rutine/unlike.dart';
import 'package:calafi/components/chat/chat.dart';
import 'package:calafi/components/chat/chatButton.dart';
import 'package:calafi/components/exercise/video.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/components/profile.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/models/routine/routine.dart';
import 'package:calafi/models/routine/rutineDetail.dart';
import 'package:calafi/provider/chat.dart';
import 'package:calafi/provider/sear.dart';
import 'package:calafi/provider/token.dart';
import 'package:calafi/util/getGrade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RutinPage extends StatefulWidget {
  const RutinPage({super.key});

  @override
  State<RutinPage> createState() => _RutinPageState();
}

class _RutinPageState extends State<RutinPage> {
  final String? id = Get.parameters['id'];
  final String? heart = Get.parameters['heart'];
  String grade='';
  late List<String> products;
  final chatController = Get.find<ChatController>();
  final token = Get.find<TokenController>();
  final getSearchController = Get.find<SearchModelController>();
  late bool isHeart;
  bool noHeart=false;

  @override
  void initState() {
    try{
      isHeart=bool.parse(heart!);
    }
    catch(err){
      noHeart=true;
    }
    
    fetchExerciseDetail();
    super.initState();
  }

  late final Getroutine api =
      Getroutine(id: id!, token: token.accessToken.value);
  GetRoutineModel? exercisedetailModel;
  bool isLoading = true;

  late final GetroutineDetail getroutineDetailapi = GetroutineDetail(id: id!, token: token.accessToken.value);
  List<RoutineDetailItem>? routineDetailModel;

  void fetchExerciseDetail() async {
    final result = await api.Getroutine_post();
    routineDetailModel = await getroutineDetailapi.GetroutineDetail_post();
    setState(() {
      exercisedetailModel = result[0];
      isLoading = false;
      grade = getGrade(exercisedetailModel!.grade);
      products = exercisedetailModel!.tags.split(',');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Header(),
                isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Expanded(
                  child: ListView(
                    children: [
                      SizedBox(height: 24,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Profile(image: 
                                            exercisedetailModel?.profileImage??
                                            'assets/images/user.png', size: 48),
                                    SizedBox(width: 16,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('${exercisedetailModel?.authorName}',style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                                        Text(grade,style: AppTextStyles.R12.copyWith(color: AppColor.gray500),)
                                      ],
                                    ),
                                  ],
                                ),
                            
                                SizedBox(height: 12,),
                                Text('${exercisedetailModel?.routineName}',style: AppTextStyles.M24.copyWith(color: AppColor.gray900),),
                                SizedBox(height: 12,),
                                Row(
                                  children: [
                                    ...products.map((products) => Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Container( padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),decoration: BoxDecoration(color: AppColor.gray200,borderRadius: BorderRadius.circular(50)), child: Text(products,style: AppTextStyles.R16.copyWith(color: AppColor.gray900),)),
                                    )),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Text('설명',style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                                SizedBox(height: 8,),
                                Text('${exercisedetailModel?.description}',style: AppTextStyles.R16.copyWith(color: AppColor.gray900),),
                                SizedBox(height: 20,),
                                Text('목록',style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                              ],
                            ),
                          ),
                          SizedBox(
                                  height: 400,
                                  child: ListView.builder(
                                    itemCount: routineDetailModel!.length,
                                    itemBuilder: (context, index) {
                                      final video = routineDetailModel![index];
                                      return ExerciseVideo(
                                        videoUrl: video.videoUrl,
                                        isadd: false,
                                        image:'assets/images/exer.jpg' ,
                                        // image: video.videoUrl??'assets/images/exer.jpg',
                                        detail: video.videoTitle,
                                        title: video.authorName,
                                      );
                                    },
                                  ),
                                ),
                        ],
                      )
                    ],
                  ),
                ),
                Footer(isClick: 0,)
              ],
            ),
            Chat(token: token.accessToken.value,id: int.parse(id!),isRorE: false,),
            Chatbutton(),

            noHeart?SizedBox():Obx(()=>chatController.isOpen.value?SizedBox():Positioned(
              right: 12,
              bottom: 120,
              child: GestureDetector(
                onTap: () async{
                  if(isHeart==true){
                    final unlike = UnlikePost(routineId: int.parse(id!), token: token.accessToken.value);
                    await unlike.unlike_post();
                  }
                  else{
                    final like = LikePost(routineId:  int.parse(id!), token: token.accessToken.value);
                    await like.like_post();
                  }
                  getSearchController.searchapi();
                  setState(() {
                    isHeart=!isHeart;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.gray
                  ),
                  child: isHeart?SvgPicture.asset('assets/icon/heart/full.svg'):SvgPicture.asset('assets/icon/heart/empty.svg'),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}