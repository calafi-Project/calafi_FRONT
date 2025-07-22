import 'dart:async';
import 'package:calafi/api/apiurl.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/provider/db/weekController.dart';
import 'package:calafi/provider/routineComplete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class Videoplay extends StatefulWidget {
  final List<String> videoUrl;
  final List<int> count;
  const Videoplay({required this.count, required this.videoUrl, super.key});

  @override
  State<Videoplay> createState() => _VideoplayState();
}

class _VideoplayState extends State<Videoplay> {
  late VideoPlayerController _controller;
  final weekController = Get.find<ExerciseWeekController>();
  final routinecomplete = Get.find<Routinecomplete>();
  int videoIndex = 0;
  int repeatIndex = 0;

  Timer? _playTimer;
  int _playSeconds = 0;
  bool _ended = false; // 중복 호출 방지 플래그

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController() {
    _ended = false; // 영상 시작할 때마다 초기화
    _controller = VideoPlayerController.network("$apiUrl${widget.videoUrl[videoIndex]}")
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    _controller.addListener(() {
      final isPlaying = _controller.value.isPlaying;
      if (isPlaying && (_playTimer == null || !_playTimer!.isActive)) {
        _startPlayTimer();
      } else if (!isPlaying && (_playTimer?.isActive ?? false)) {
        _stopPlayTimer();
      }

      final isEnded = _controller.value.position >= _controller.value.duration;
      if (isEnded && !isPlaying && !_ended) {
        _ended = true;
        Future.microtask(() => _onVideoEnd());
      }
    });
  }

  Future<void> _onVideoEnd() async {
    if (repeatIndex < widget.count[videoIndex] - 1) {
      repeatIndex++;
      _ended = false; // 다음 반복에서 다시 감지 가능하도록 초기화
      await _controller.seekTo(Duration.zero);
      await _controller.play();
    } else {
      if (videoIndex < widget.videoUrl.length - 1) {
        videoIndex++;
        repeatIndex = 0;
        await _controller.pause();
        await _controller.dispose();
        _initController();
      } else {
        _stopPlayTimer();
        routinecomplete.completeRoutine.value++;
        routinecomplete.percent.value = routinecomplete.todaysRoutine.value == 0
            ? 0
            : ((routinecomplete.completeRoutine.value / routinecomplete.todaysRoutine.value) * 100).round();
        if(routinecomplete.percent.value==100){
          await weekController.updateState(getKoreaWeekdayIndex(), 1);
        }
        await routinecomplete.setTime(_playSeconds);
        Get.toNamed('Home');
      }
    }
  }

  void _startPlayTimer() {
    _playTimer?.cancel();
    _playTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _playSeconds++;
      });
    });
  }

  void _stopPlayTimer() {
    _playTimer?.cancel();
  }

  int getKoreaWeekdayIndex() {
    final now = DateTime.now().toUtc().add(const Duration(hours: 9));
    int weekday = now.weekday;
    return weekday == 7 ? 6 : weekday - 1;
  }

  @override
  void dispose() {
    _stopPlayTimer();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: _controller.value.isInitialized
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
            const SizedBox(height: 20),
            IconButton(
              iconSize: 48,
              icon: Icon(
                _controller.value.isPlaying ? Icons.pause_circle : Icons.play_circle,
                color: AppColor.gray700,
              ),
              onPressed: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    if (_controller.value.position >= _controller.value.duration) {
                      _controller.seekTo(Duration.zero);
                    }
                    _controller.play();
                  }
                });
              },
            ),
            Text('영상 ${videoIndex + 1} / ${widget.videoUrl.length}'),
            Text('반복 ${repeatIndex + 1} / ${widget.count[videoIndex]}'),
            Text('재생 시간: $_playSeconds초'),
          ],
        )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
