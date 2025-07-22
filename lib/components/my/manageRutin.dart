import 'package:calafi/api/rutine/weekAddRoutine.dart';
import 'package:calafi/api/rutine/weekDeleteRoutine.dart';
import 'package:calafi/components/profile.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/days/manage.dart';
import 'package:calafi/provider/weekRoutine.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyManageRuntin extends StatefulWidget {
  final String image,name,title,document;
  final bool isadd;
  final bool isEvery;
  final int id;
  final String token;
  const MyManageRuntin({required this.token,required this.id,required this.isEvery,required this.document,required this.image,required this.isadd, required this.name , required this.title,super.key});

  @override
  State<MyManageRuntin> createState() => _MyManageRuntinState();
}

class _MyManageRuntinState extends State<MyManageRuntin> {
  late bool isadd;
  final weekController = Get.find<WeekroutineController>();
  final dayController = Get.find<ManageDaysController>();
  @override
  void initState() {
    isadd=widget.isadd;
    super.initState();
  }

    @override
    Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: widget.isEvery ? Border(bottom: BorderSide(color: AppColor.gray300, width: 1)) : Border(),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded( // 이게 핵심
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Profile(image: widget.image, size: 24),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          widget.name,
                          style: AppTextStyles.R14.copyWith(color: AppColor.gray600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.title,
                    style: AppTextStyles.M16.copyWith(color: AppColor.gray900),
                    softWrap: true,
                  ),
                  Text(
                    widget.document,
                    style: AppTextStyles.R14.copyWith(color: AppColor.gray500),
                    softWrap: true,
                  )
                ],
              ),
            ),
            SizedBox(width: 12),
            GestureDetector(
              onTap: () async{
                if(widget.isadd){
                  //추가\
                  final Weekaddroutine weekaddroutine = Weekaddroutine(routineId: widget.id, weekday: dayController.GetClick(), token: widget.token);
                  await weekaddroutine.comment_post();
                  await weekController.weekapi(dayController.GetClick());
                }
                else{
                  //삭제
                  final Weekdeleteroutine weekaddroutine = Weekdeleteroutine(routineId: widget.id, weekday: dayController.GetClick(), token: widget.token);
                  await weekaddroutine.comment_post();
                  await weekController.weekapi(dayController.GetClick());
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.gray100,
                ),
                width: 26,
                height: 26,
                child: Center(
                  child: isadd
                      ? SvgPicture.asset('assets/icon/add.svg')
                      : SvgPicture.asset('assets/icon/minus.svg'),
                ),
              ),
            )
          ],
        ),
      );
    }

  }



