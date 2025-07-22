import 'package:calafi/api/rutine/getRoutine.dart';
import 'package:calafi/api/rutine/getRoutineDetail.dart';
import 'package:calafi/components/button.dart';
import 'package:calafi/components/exercise/video.dart';
import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/models/routine/routine.dart';
import 'package:calafi/models/routine/rutineDetail.dart';
import 'package:calafi/models/workList.dart';
import 'package:calafi/provider/db/weekController.dart';
import 'package:calafi/provider/routineComplete.dart';
import 'package:calafi/provider/token.dart';
import 'package:calafi/screens/home/videoPlay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePlayPage extends StatefulWidget {
  const HomePlayPage({super.key});

  @override
  State<HomePlayPage> createState() => _HomePlayPageState();
}

class _HomePlayPageState extends State<HomePlayPage> {
  final token = Get.find<TokenController>();
  final String? id = Get.parameters['id'];

  late final Getroutine api = Getroutine(id: id!, token: token.accessToken.value);
  late final GetroutineDetail detailApi = GetroutineDetail(id: id!, token: token.accessToken.value);
  late List<String> videoUrls;
  late List<int> counts;
  final routineController = Get.find<Routinecomplete>();
  final weekController = Get.find<ExerciseWeekController>();

  GetRoutineModel? routine;
  List<RoutineDetailItem> details = [];
  bool isLoading = true;
  List<String> products = [];
  
  @override
  void initState() {
    super.initState();
    fetchRoutine();
  }

  void fetchRoutine() async {
    final r = await api.Getroutine_post();
    final d = await detailApi.GetroutineDetail_post();

    // title에서 반복 횟수 추출 후 [반복횟수, url] 리스트 생성
    List<List<dynamic>> repeatAndUrls = d.map((item) {
      int repeatCount = 1; // 기본 1회
      final parts = item.videoTitle.split('X');
      if (parts.length > 1) {
        // 오른쪽 문자열에서 숫자만 추출 (공백 제거)
        final right = parts[1].trim();
        repeatCount = int.tryParse(right) ?? 1;
      }
      return [repeatCount, item.videoUrl];
    }).toList();

    setState(() {
      videoUrls = repeatAndUrls.map((e) => e[1] as String).toList();
      counts = repeatAndUrls.map((e) => e[0] as int).toList();
      routineController.worklist.value = repeatAndUrls.map((e) {
      final index = repeatAndUrls.indexOf(e);
        return Worklist(
          name: d[index].videoTitle,
          set: e[0] as int,
        );
      }).toList();

      routine = r[0];
      details = d;
      products = routine!.tags.split(',');
      isLoading = false;
    });

    print('반복 횟수, url 리스트: $repeatAndUrls');
    
  }
  int getKoreaWeekdayIndex() {
    final now = DateTime.now().toUtc().add(Duration(hours: 9)); // 한국 시간 (UTC+9)
    int weekday = now.weekday; // Dart: 월=1 ~ 일=7

    // 월요일=0, ..., 일요일=6 로 변환
    return weekday == 7 ? 6 : weekday - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      children: [
                        const SizedBox(height: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${routine?.routineName}', style: AppTextStyles.M24.copyWith(color: AppColor.gray900)),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: products
                                        .map((tag) => Padding(
                                              padding: const EdgeInsets.only(right: 4),
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                decoration: BoxDecoration(
                                                    color: AppColor.gray200,
                                                    borderRadius: BorderRadius.circular(50)),
                                                child: Text(tag, style: AppTextStyles.R16.copyWith(color: AppColor.gray900)),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                  const SizedBox(height: 20),
                                  Text('설명', style: AppTextStyles.M20.copyWith(color: AppColor.gray900)),
                                  const SizedBox(height: 8),
                                  Text('${routine?.description}', style: AppTextStyles.R16.copyWith(color: AppColor.gray900)),
                                  const SizedBox(height: 20),
                                  Text('목록', style: AppTextStyles.M20.copyWith(color: AppColor.gray900)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              height: 240,
                              child: ListView.builder(
                                itemCount: details.length,
                                itemBuilder: (context, index) {
                                  final video = details[index];
                                  return ExerciseVideo(
                                    videoUrl: video.videoUrl,
                                    isadd: false,
                                    image: 'assets/images/exer.jpg', // 또는 video.thumbnailUrl
                                    detail: video.videoTitle,
                                    title: video.authorName,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                              child: GestureDetector(
                                onTap: () async{
                                  await weekController.updateState(getKoreaWeekdayIndex(),2);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Videoplay(
                                        videoUrl: videoUrls,
                                        count: counts,
                                      ),
                                    ),
                                  );
                                },
                                child: Button(state: true, text: '시작하기')
                              ),
                            )
                          ],
                        )
                      ],
                    ),
            ),
            const Footer(isClick: 1),
          ],
        ),
      ),
    );
  }
}
