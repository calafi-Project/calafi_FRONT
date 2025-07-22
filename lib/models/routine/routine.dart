class GetRoutineModel {
  final int routineId;
  final String routineName;
  final String description;
  final String tags;
  final int likes;
  final DateTime createdAt;
  final String authorName;
  final String? profileImage;
  final int grade;

  GetRoutineModel({
    required this.routineId,
    required this.routineName,
    required this.description,
    required this.tags,
    required this.likes,
    required this.createdAt,
    required this.authorName,
    this.profileImage,
    required this.grade,
  });

  factory GetRoutineModel.fromJson(Map<String, dynamic> json) {
    return GetRoutineModel(
      routineId: json['routine_id'],
      routineName: json['routine_name'],
      description: json['description'],
      tags: json['tags'],
      likes: json['likes'],
      createdAt: DateTime.parse(json['created_at']),
      authorName: json['author_name'],
      profileImage: json['profile_image'],
      grade: json['grade'],
    );
  }
}