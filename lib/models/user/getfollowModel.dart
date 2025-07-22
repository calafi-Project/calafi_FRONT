class getUserFollowModel {
  final int id;
  final int grade;
  final String? profileImage;
  final String name;

  getUserFollowModel({
    required this.id,
    required this.grade,
    required this.profileImage,
    required this.name,
  });

  factory getUserFollowModel.fromJson(Map<String, dynamic> json) {
    return getUserFollowModel(
      id: json['id'],
      grade: json['grade'],
      profileImage: json['profile_image'],
      name: json['name'],
    );
  }
}
