import 'package:calafi/config/app_color.dart';
import 'package:calafi/provider/chat.dart';
import 'package:calafi/provider/footer.dart';
import 'package:calafi/provider/selector/follow.dart';
import 'package:calafi/provider/selector/manage.dart';
import 'package:calafi/provider/selector/member.dart';
import 'package:calafi/screens/detail/exercise.dart';
import 'package:calafi/screens/detail/member.dart';
import 'package:calafi/screens/detail/rutin.dart';
import 'package:calafi/screens/follow.dart';
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
        GetPage(name: '/Search', page: ()=> SearchPage()),
        GetPage(name: '/Exercise', page: ()=>ExercisePage()),
        GetPage(name: '/Rutin', page: ()=>RutinPage()),
        GetPage(name: '/Member', page: ()=>MemberPage()),
        GetPage(name: '/Follow', page: ()=>FollowPage()),
        GetPage(name: '/My', page: ()=>MyPage()),
        GetPage(name: '/MySet', page: ()=>SetPage()),
        GetPage(name: '/MyInfo', page: ()=>MyInfoPage()),
        GetPage(name: '/MyUpdate', page: ()=>MyUpdatePage()),
        GetPage(name: '/Rank', page: ()=>RankPage()),
        GetPage(name: '/MyManage', page: ()=>MyManagePage()),
        GetPage(name: '/Manage', page: ()=>ManagePage()),
      ],
      initialRoute: '/Manage',
    );
  }
}
