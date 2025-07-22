class WeekRoutineModel {
  final int id;
  final String name;
  final String description;
  final String tags;
  final int likes;
  final String authorName;
  String authorProfile;

  WeekRoutineModel({
    required this.id,
    required this.name,
    required this.description,
    required this.tags,
    required this.likes,
    required this.authorName,
    required this.authorProfile
  });

  factory WeekRoutineModel.fromJson(Map<String, dynamic> json) {
    return WeekRoutineModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      tags: json['tags'] ?? '',
      likes: json['likes'] ?? 0,
      authorName: json['authorName'] ?? '',
      authorProfile: json['authorProfile'] ?? 'assets/images/user.png',
    );
  }
}
