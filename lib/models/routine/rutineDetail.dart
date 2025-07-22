class RoutineDetailItem {
  final int routineId;
  final String routineName;
  final String routineDescription;
  final List<String> routineTags;
  final String authorName;
  final String? authorProfileImage;
  final int authorGrade;
  final int videoId;
  final String videoTitle;
  final String videoUrl,customtitle;

  RoutineDetailItem({
    required this.customtitle,
    required this.routineId,
    required this.routineName,
    required this.routineDescription,
    required this.routineTags,
    required this.authorName,
    required this.authorProfileImage,
    required this.authorGrade,
    required this.videoId,
    required this.videoTitle,
    required this.videoUrl,
  });

  factory RoutineDetailItem.fromJson(Map<String, dynamic> json) {
    return RoutineDetailItem(
      routineId: json['routine_id'],
      routineName: json['routine_name'],
      routineDescription: json['routine_description'],
      routineTags: (json['routine_tags'] as String).split(',').map((e) => e.trim()).toList(),
      authorName: json['author_name'],
      authorProfileImage: json['author_profile_image'],
      authorGrade: json['author_grade'],
      videoId: json['video_id'],
      customtitle: json['custom_title']??'',
      videoTitle: json['detail_name']??'',
      videoUrl: json['video_url']??'',
    );
  }
}
