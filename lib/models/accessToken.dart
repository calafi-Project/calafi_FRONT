class Accesstoken {
  final String accessToken;

  Accesstoken({required this.accessToken});

  factory Accesstoken.fromJson(Map<String, dynamic> json) {
    return Accesstoken(accessToken: json['accessToken']);
  }
}
