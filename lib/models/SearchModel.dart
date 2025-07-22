class ExerciseModel {
  final int id;
  final String name;
  final String description;
  final String guide;
  final String need;
  final String? imageUrl;
  final bool isHeart;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.guide,
    required this.need,
    this.imageUrl,
    required this.isHeart,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      guide: json['guide'],
      need: json['need'],
      imageUrl: json['image_url'],
      isHeart: json['isHeart'] == 1,
    );
  }
}

class RoutineModel {
  final int id;
  final int userId;
  final String name;
  final String description;
  final String tags;
  final int likes;
  final String createdAt;
  final String authorName;
  final String? authorProfile;
  final bool isHeart;
  final bool isFollow;

  RoutineModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.tags,
    required this.likes,
    required this.createdAt,
    required this.authorName,
    this.authorProfile,
    required this.isHeart,
    required this.isFollow,
  });

  factory RoutineModel.fromJson(Map<String, dynamic> json) {
    return RoutineModel(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      description: json['description'],
      tags: json['tags'],
      likes: json['likes'],
      createdAt: json['created_at'],
      authorName: json['author_name'],
      authorProfile: json['author_profile'],
      isHeart: json['isHeart'] == 1,
      isFollow: json['isFollow'] == 1,
    );
  }
}

class SimpleUserModel {
  final int id;
  final String name;
  final String? profileImage;
  final int grade;
  final bool isFollow;

  SimpleUserModel({
    required this.grade,
    required this.id,
    required this.name,
    this.profileImage,
    required this.isFollow,
  });

  factory SimpleUserModel.fromJson(Map<String, dynamic> json) {
    return SimpleUserModel(
      grade: json['grade'],
      id: json['id'],
      name: json['name'],
      profileImage: json['profile_image'],
      isFollow: json['isFollow'] == 1,
    );
  }
}

class SearchModel {
  final List<ExerciseModel> exercises;
  final List<RoutineModel> routines;
  final List<SimpleUserModel> users;

  SearchModel({
    required this.exercises,
    required this.routines,
    required this.users,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      exercises: (json['exercises'] as List)
          .map((e) => ExerciseModel.fromJson(e))
          .toList(),
      routines: (json['routines'] as List)
          .map((e) => RoutineModel.fromJson(e))
          .toList(),
      users: (json['users'] as List).map((e) => SimpleUserModel.fromJson(e)).toList(),
    );
  }
}
