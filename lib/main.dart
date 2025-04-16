import 'package:calafi/config/app_color.dart';
import 'package:calafi/provider/chat.dart';
import 'package:calafi/provider/footer.dart';
import 'package:calafi/provider/selector/follow.dart';
import 'package:calafi/provider/selector/member.dart';
import 'package:calafi/screens/detail/exercise.dart';
import 'package:calafi/screens/detail/member.dart';
import 'package:calafi/screens/detail/rutin.dart';
import 'package:calafi/screens/follow.dart';
import 'package:calafi/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(FooterController());
  Get.put(ChatController());
  Get.put(MemberController());
  Get.put(FollowController());
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  MainApp({super.key});

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
      ],
      initialRoute: '/Follow',
    );
  }
}
