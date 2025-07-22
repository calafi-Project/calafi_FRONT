class CreateUser {
  final List<CreateExerciseVideo> videos;
  final List<CreateRoutine> routines;

  CreateUser({
    required this.videos,
    required this.routines,
  });

  factory CreateUser.fromJson(Map<String, dynamic> json) {
    return CreateUser(
      videos: (json['exercise'] as List?)?.map((e) => CreateExerciseVideo.fromJson(e)).toList() ?? [],
      routines: (json['routines'] as List?)?.map((e) => CreateRoutine.fromJson(e)).toList() ?? [],
    );
  }
}

class CreateExerciseVideo {
  final String? videourl;
  final int id;
  final int exerciseid;
  final String title;

  CreateExerciseVideo({
    required this.title,
    this.videourl,
    required this.id,
    required this.exerciseid,
  });

  factory CreateExerciseVideo.fromJson(Map<String, dynamic> json) {
    return CreateExerciseVideo(
      title : json['title'],
      videourl: json['video_url'],
      id: json['id'] ?? 0,
      exerciseid: json['exercise_id'] ?? 0,
    );
  }
}

class CreateRoutine {
  final int id;
  final String name;
  final String description;
  final String tags;
  final int likes;

  CreateRoutine({
    required this.id,
    required this.name,
    required this.description,
    required this.tags,
    required this.likes
  });

  factory CreateRoutine.fromJson(Map<String, dynamic> json) {
    return CreateRoutine(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      tags: json['tags']??'',
      likes: json['likes']
    );
  }
}