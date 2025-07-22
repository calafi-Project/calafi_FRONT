import 'package:calafi/api/apiurl.dart';
import 'package:calafi/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayScreen({required this.videoUrl, super.key});

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network("$apiUrl${widget.videoUrl}")
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
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
                            // 영상이 끝났으면 처음부터 다시 재생
                            _controller.seekTo(Duration.zero);
                          }
                          _controller.play();
                        }
                      });
                    }
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
