import 'package:calafi/config/app_color.dart';
import 'package:calafi/provider/chat.dart';
import 'package:calafi/provider/days/homeRutin.dart';
import 'package:calafi/provider/footer.dart';
import 'package:calafi/provider/selector/follow.dart';
import 'package:calafi/provider/selector/manage.dart';
import 'package:calafi/provider/selector/member.dart';
import 'package:calafi/screens/detail/exercise.dart';
import 'package:calafi/screens/detail/member.dart';
import 'package:calafi/screens/detail/rutin.dart';
import 'package:calafi/screens/follow.dart';
import 'package:calafi/screens/home/home.dart';
import 'package:calafi/screens/home/play.dart';
import 'package:calafi/screens/home/report.dart';
import 'package:calafi/screens/home/rutin.dart';
import 'package:calafi/screens/home/weight.dart';
import 'package:calafi/screens/manage/manage.dart';
import 'package:calafi/screens/my/info.dart';
import 'package:calafi/screens/my/manage.dart';
import 'package:calafi/screens/my/my.dart';
import 'package:calafi/screens/my/set.dart';
import 'package:calafi/screens/my/update.dart';
import 'package:calafi/screens/rank.dart';
import 'package:calafi/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(FooterController());
  Get.put(ChatController());
  Get.put(MemberController());
  Get.put(FollowController());
  Get.put(MyManageController());
  Get.put(HomeDayRutinController());
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColor.gray700,
            selectionColor: AppColor.gray300,
            selectionHandleColor: AppColor.gray300
          )
      ),

      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/Search', page: ()=> SearchPage(),transition: Transition.noTransition),
        GetPage(name: '/Exercise', page: ()=>ExercisePage(),transition: Transition.noTransition),
        GetPage(name: '/Rutin', page: ()=>RutinPage(),transition: Transition.noTransition),
        GetPage(name: '/Member', page: ()=>MemberPage(),transition: Transition.noTransition),
        GetPage(name: '/Follow', page: ()=>FollowPage(),transition: Transition.noTransition),
        GetPage(name: '/My', page: ()=>MyPage(),transition: Transition.noTransition),
        GetPage(name: '/MySet', page: ()=>SetPage(),transition: Transition.noTransition),
        GetPage(name: '/MyInfo', page: ()=>MyInfoPage(),transition: Transition.noTransition),
        GetPage(name: '/MyUpdate', page: ()=>MyUpdatePage(),transition: Transition.noTransition),
        GetPage(name: '/Rank', page: ()=>RankPage(),transition: Transition.noTransition),
        GetPage(name: '/MyManage', page: ()=>MyManagePage(),transition: Transition.noTransition),
        GetPage(name: '/Manage', page: ()=>ManagePage(),transition: Transition.noTransition),
        GetPage(name: '/Report', page: ()=>ReportPage(),transition: Transition.noTransition),
        GetPage(name: '/HomeRutin', page: ()=>HomeRutinPage(),transition: Transition.noTransition),
        GetPage(name: '/Play', page: ()=>HomePlayPage(),transition: Transition.noTransition),
        GetPage(name: '/Weight', page: ()=>WeightPage(),transition: Transition.noTransition),
        GetPage(name: '/Home', page: ()=>HomePage(),transition: Transition.noTransition)
      ],
      initialRoute: '/Home',
    );
  }
}
