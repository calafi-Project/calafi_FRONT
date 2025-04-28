import 'package:calafi/components/alram/alram.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/config/app_color.dart';
import 'package:flutter/material.dart';

class AlramPage extends StatelessWidget {
  const AlramPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 12,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return AlramBox(date: '2022-22-22', isState: true, text: '빨리 접속하여서 리카르도에게 근육을 주세요 ');
                  },
                ),
              ),
            ),
            Footer(isClick: 0)
          ],
        ),
      ),
    );
  }
}