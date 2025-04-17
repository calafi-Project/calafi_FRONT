import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/components/rank.dart';
import 'package:calafi/config/app_color.dart';
import 'package:flutter/material.dart';

class RankPage extends StatelessWidget {
  const RankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 18,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    Rank(again: 5,name: '근육',rutin: 100,image: 'assets/images/rank/strong.png',),
                    Rank(again: 3,name: '근성장',rutin: 50,image: 'assets/images/rank/stless.png',),
                    Rank(again: 2,name: '나약',rutin: 30,image: 'assets/images/rank/nayack.png',),
                    Rank(again: 1,name: '멸치',rutin: 10,image: 'assets/images/rank/fish.png',),
                    Rank(again: 0,name: '먼지',rutin: 0,image: 'assets/images/rank/munzi.png',)
                  ],
                ),
              ),
            ),
            Footer(isClick: 0,)
          ],
        ),
      ),
    );
  }
}