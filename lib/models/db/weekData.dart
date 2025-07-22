class ExerciseDay {
  final int day;     // 0~6
  final int state;   // 1: 완료, 2: 조금, 3: 미완료

  ExerciseDay({required this.day, required this.state});

  factory ExerciseDay.fromMap(Map<String, dynamic> map) {
    return ExerciseDay(
      day: map['day'],
      state: map['state'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'state': state,
    };
  }
}
