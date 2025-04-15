import 'package:calafi/config/app_color.dart';
import 'package:calafi/provider/footer.dart';
import 'package:calafi/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final footerController=Get.put(FooterController());
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
      ],
      initialRoute: '/Search',
    );
  }
}
