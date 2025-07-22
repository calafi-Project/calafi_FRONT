import 'package:calafi/components/search/exercise.dart';
import 'package:calafi/components/search/members.dart';
import 'package:calafi/components/search/rutin.dart';
import 'package:calafi/components/search/widget/Title.dart';
import 'package:calafi/components/search/widget/more.dart';
import 'package:calafi/provider/sear.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:calafi/components/search/exercise.dart';
// import 'package:calafi/components/search/members.dart';
// import 'package:calafi/components/search/rutin.dart';
// import 'package:calafi/components/search/widget/Title.dart';
// import 'package:calafi/components/search/widget/more.dart';
// import 'package:calafi/provider/sear.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class Searchevery extends StatelessWidget {
  final String token;
  const Searchevery({required this.token, super.key});

  @override
  Widget build(BuildContext context) {
    final resultController = Get.find<SearchModelController>();

    return Obx(() {
      final data = resultController.result.value;
      if (data == null) return SizedBox();

      return ListView(
        children: [
          // 운동
          if (data.exercises.length >= 1) ...[
            SearchTitle(text: '운동'),
            const SizedBox(height: 8),
            ...data.exercises.take(2).map((exercise) => Exercise(
              id: exercise.id,
              imageurl: exercise.imageUrl ?? 'assets/images/exer.jpg',
              exerciseName: exercise.name,
              exerciseTool: exercise.need.split(','),
              isHeart: exercise.isHeart,
            )),
            const SizedBox(height: 4),
            SearchMore(selector: 1),
          ],

          // 루틴
          if (data.routines.length >= 1) ...[
            SearchTitle(text: '루틴'),
            ...data.routines.take(2).map((routine) => Rutin(
              isMy: false,
              id: routine.id,
              token: token,
              isEvery: false,
              title: routine.name,
              heartCount: routine.likes,
              document: routine.description,
              isHeart: routine.isHeart,
              name: routine.authorName,
              image: routine.authorProfile ?? 'assets/images/user.png',
            )),
            SearchMore(selector: 2),
          ],

          // 회원
          if (data.users.length >= 1) ...[
            SearchTitle(text: '회원'),
            ...data.users.take(2).map((user) => Members(
              isMy: false,
              token: token,
              id: user.id,
              grade: user.grade,
              isFollow: user.isFollow,
              name: user.name,
              images: user.profileImage ?? 'assets/images/user.png',
            )),
            SearchMore(selector: 3),
          ],
        ],
      );
    });
  }
}
