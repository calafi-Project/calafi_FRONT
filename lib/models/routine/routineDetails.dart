class RoutineDetailVideos {
  final int id;
  final int exerciseid;
  final String title;
  final String videoUrl;

  RoutineDetailVideos({
    required this.exerciseid,
    required this.id,
    required this.title,
    required this.videoUrl,
  });

  factory RoutineDetailVideos.fromJson(Map<String, dynamic> json) {
    return RoutineDetailVideos(
      id: json['id'],
      title: json['title'],
      videoUrl: json['video_url'],
      exerciseid: json['exercise_id'],
    );
  }
}
