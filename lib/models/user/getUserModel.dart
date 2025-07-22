class UserModel {
  final int id;
  final String email;
  final String name;
  final int age;
  final int height;
  final int weight;
  final String? profileImage;
  final int grade;
  final int workTime;
  final int completeRoutine;
  final int caloriBurned;
  final int isRoutine;
  final int isWorkout;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
    this.profileImage,
    required this.grade,
    required this.workTime,
    required this.completeRoutine,
    required this.caloriBurned,
    required this.isRoutine,
    required this.isWorkout,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id:json['id'],
      email: json['email'],
      name: json['name'],
      age: json['age'],
      height: json['height'],
      weight: json['weight'],
      profileImage: json['profile_image'],
      grade: json['grade'],
      workTime: json['work_time'],
      completeRoutine: json['complete_routine'],
      caloriBurned: json['calori_burned'],
      isRoutine: json['isroutine'],
      isWorkout: json['isworkout'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'email': email,
      'name': name,
      'age': age,
      'height': height,
      'weight': weight,
      'profile_image': profileImage,
      'grade': grade,
      'work_time': workTime,
      'complete_routine': completeRoutine,
      'calori_burned': caloriBurned,
      'isroutine': isRoutine,
      'isworkout': isWorkout,
    };
  }
}
