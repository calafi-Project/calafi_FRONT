import 'package:calafi/api/apiurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class UnFollowApi {
  late int followingId;
  late String token;
  // String  apiAddress = dotenv.get("APIURL");
  UnFollowApi({required this.followingId,required this.token});

  Future comment_post() async {
    Map<String, dynamic> postData = {
      'followingId': followingId,
    };

    try {
      await http.post(
        Uri.parse('$apiUrl/follow/unfollow/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(postData),
      );
    } catch (e) {
      print('에러 : $e');
      throw Exception('Error occurred: $e');
    }
  }
}