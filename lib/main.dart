import 'package:calafi/config/app_color.dart';
import 'package:calafi/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MainApp());
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
        GetPage(name: '/Search', page: ()=> SearchPage())
      ],
      initialRoute: '/Search',
    );
  }
}
