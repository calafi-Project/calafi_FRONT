class ExerciseVideoModels {
  final int id;
  final int exerciseId;
  final String title;
  final String videoUrl;
  final int createdBy;
  final DateTime createdAt;
  final bool isHeart;

  ExerciseVideoModels({
    required this.id,
    required this.exerciseId,
    required this.title,
    required this.videoUrl,
    required this.createdBy,
    required this.createdAt,
    required this.isHeart,
  });

  factory ExerciseVideoModels.fromJson(Map<String, dynamic> json) {
    return ExerciseVideoModels(
      id: json['id'],
      exerciseId: json['exercise_id'],
      title: json['title'],
      videoUrl: json['video_url'],
      createdBy: json['created_by'],
      createdAt: DateTime.parse(json['created_at']),
      isHeart: json['isHeart'] == 1 || json['isHeart'] == true || json['isHeart'] == '1', // null 대비
    );
  }
}
