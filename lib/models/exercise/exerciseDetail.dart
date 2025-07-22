class ExerciseDetail {
  final int id;
  final String name;
  final String description;
  final String guide;
  final String need;
  final String? imageUrl;
  final List<ExerciseVideoModel> videos;

  ExerciseDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.guide,
    required this.need,
    this.imageUrl,
    required this.videos,
  });

  factory ExerciseDetail.fromJson(Map<String, dynamic> json) {
    return ExerciseDetail(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      guide: json['guide'],
      need: json['need'],
      imageUrl: json['image_url'],
      videos: (json['videos'] as List)
          .map((e) => ExerciseVideoModel.fromJson(e))
          .toList(),
    );
  }
}

class ExerciseVideoModel {
  final int id;
  final String title;
  final String videoUrl;
  final String createdAt;
  final String creatorName;
  final String? creatorProfile;

  ExerciseVideoModel({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.createdAt,
    required this.creatorName,
    this.creatorProfile,
  });

  factory ExerciseVideoModel.fromJson(Map<String, dynamic> json) {
    return ExerciseVideoModel(
      id: json['id'],
      title: json['title'],
      videoUrl: json['video_url'],
      createdAt: json['created_at'],
      creatorName: json['creator_name'],
      creatorProfile: json['creator_profile'],
    );
  }
}
