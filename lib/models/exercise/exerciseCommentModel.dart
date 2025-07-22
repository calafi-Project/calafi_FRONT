class ExerciseComment {
  final int id;
  final String content;
  final DateTime createdAt;
  final String userName;

  ExerciseComment({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.userName,
  });

  factory ExerciseComment.fromJson(Map<String, dynamic> json) {
    return ExerciseComment(
      id: json['id'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
      userName: json['user_name'],
    );
  }

  /// ✨ Chat 위젯용 포맷 변환
  List<String> toChatFormat() {
    return [userName, content, 'assets/images/user.png']; // 프로필 이미지 있으면 바꿔도 됨
  }
}
