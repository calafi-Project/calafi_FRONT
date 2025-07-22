class GetfollowsModel {
  final int followerCount;
  final int followingCount;

  static var obs;

  GetfollowsModel({
    required this.followerCount,
    required this.followingCount,
  });

  factory GetfollowsModel.fromJson(Map<String, dynamic> json) {
    return GetfollowsModel(
      followerCount:json['followerCount'],
      followingCount: json['followingCount'],
    );
  }
}
