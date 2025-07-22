import 'package:calafi/components/search/exercise.dart';
import 'package:calafi/components/search/members.dart';
import 'package:calafi/components/search/rutin.dart';
import 'package:calafi/components/search/widget/searchTop.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/sear.dart';
import 'package:calafi/provider/search.dart';
import 'package:calafi/provider/token.dart';
import 'package:calafi/screens/search/searchevery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Searched extends StatefulWidget {
  const Searched({super.key});

  @override
  State<Searched> createState() => _SearchedState();
}

class _SearchedState extends State<Searched> {
  final searchController = Get.put(SeaController());
  final resultController = Get.find<SearchModelController>();
  final tokenController = Get.find<TokenController>();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      searchController.changeClick(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchTop(),
        const SizedBox(height: 20),
        Obx(() {
          final data = resultController.result.value;
          return searchController.selector.value == 2
              ? Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        '총 ${data?.routines.length ?? 0}건',
                        style: AppTextStyles.M18.copyWith(color: AppColor.gray900),
                      ),
                    ),
                  ],
                )
              : const SizedBox();
        }),
        Expanded(
          child: Obx(() {
            final data = resultController.result.value;

            // 전체
            if (searchController.selector.value == 0) {
              return Searchevery(token: tokenController.accessToken.value,);
            }

            // 운동
            if (searchController.selector.value == 1) {
              return ListView.builder(
                itemCount: data?.exercises.length ?? 0,
                itemBuilder: (context, index) {
                  final exercise = data!.exercises[index];
                  return Exercise(
                    id: exercise.id,
                    imageurl: exercise.imageUrl?? 'assets/images/exer.jpg',
                    exerciseName: exercise.name,
                    exerciseTool: exercise.need.split(','),
                    isHeart: exercise.isHeart, // 수정됨
                  );
                },
              );
            }

            // 루틴
            if (searchController.selector.value == 2) {
              return ListView.builder(
                itemCount: data?.routines.length ?? 0,
                itemBuilder: (context, index) {
                  final routine = data!.routines[index];
                  return Rutin(
                    isMy: false,
                    token: tokenController.accessToken.value,
                    id: routine.id,
                    isEvery: true,
                    title: routine.name,
                    heartCount: routine.likes,
                    document: routine.description,
                    isHeart: routine.isHeart, // 수정됨
                    name: routine.authorName, // 수정됨
                    image: routine.authorProfile ?? 'assets/images/user.png', // 수정됨
                  );
                },
              );
            }

            // 회원
            if (searchController.selector.value == 3) {
              return ListView.builder(
                itemCount: data?.users.length ?? 0,
                itemBuilder: (context, index) {
                  final user = data!.users[index];
                  return Members(
                    isMy: false,
                    token:tokenController.accessToken.value,
                    id: user.id,
                    grade: user.grade, // 필요 시 user.grade로 바꾸기
                    isFollow: user.isFollow, // 수정됨
                    name: user.name,
                    images: user.profileImage ?? 'assets/images/user.png',
                  );
                },
              );
            }
            return const Center(child: Text('에러'));
          }),
        ),
      ],
    );
  }
}
