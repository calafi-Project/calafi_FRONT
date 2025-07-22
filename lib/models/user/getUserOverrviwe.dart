class UserOverview {
  final UserInfo userInfo;
  final List<ExerciseVideoOverview> videos;
  final List<RoutineOverview> routines;

  UserOverview({
    required this.userInfo,
    required this.videos,
    required this.routines,
  });

  factory UserOverview.fromJson(Map<String, dynamic> json) {
    return UserOverview(
      userInfo: UserInfo.fromJson(json['user_info'] ?? {}),
      videos: (json['videos'] as List?)?.map((e) => ExerciseVideoOverview.fromJson(e)).toList() ?? [],
      routines: (json['routines'] as List?)?.map((e) => RoutineOverview.fromJson(e)).toList() ?? [],
    );
  }
}

class UserInfo {
  final String name;
  final String? profileImage;
  final int grade;
  final int workTime;
  final int completeRoutine;
  final int caloriBurned;

  UserInfo({
    required this.name,
    this.profileImage,
    required this.grade,
    required this.workTime,
    required this.completeRoutine,
    required this.caloriBurned,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      name: json['name'] ?? '',
      profileImage: json['profile_image'],
      grade: json['grade'] ?? 0,
      workTime: json['work_time'] ?? 0,
      completeRoutine: json['complete_routine'] ?? 0,
      caloriBurned: json['calori_burned'] ?? 0,
    );
  }
}

class ExerciseVideoOverview {
  final int id;
  final String title;
  final String videoUrl;
  final DateTime createdAt;

  ExerciseVideoOverview({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.createdAt,
  });

  factory ExerciseVideoOverview.fromJson(Map<String, dynamic> json) {
    return ExerciseVideoOverview(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      videoUrl: json['video_url'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime(2000),
    );
  }
}

class RoutineOverview {
  final int id;
  final String name;
  final String description;
  final String tags;
  final int likes;
  final bool islike;
  final DateTime createdAt;

  RoutineOverview({
    required this.id,
    required this.name,
    required this.description,
    required this.tags,
    required this.islike,
    required this.likes,
    required this.createdAt,
  });

  factory RoutineOverview.fromJson(Map<String, dynamic> json) {
    return RoutineOverview(
      islike: (json['is_liked'] ?? 0) == 1, // int → bool 변환
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      tags: json['tags'] ?? '',
      likes: json['likes'] ?? 0,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime(2000),
    );
  }
}
