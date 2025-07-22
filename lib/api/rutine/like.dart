import 'package:calafi/api/apiurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class LikePost {
  late int routineId;
  final String token;
  // String  apiAddress = dotenv.get("APIURL");
  LikePost({required this.routineId,required this.token});

  Future<void> like_post() async {
    Map<String, dynamic> postData = {
      'routineId': routineId, 
    };

    try {
      await http.post(
        Uri.parse('$apiUrl/routine/like/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(postData),
      );
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

}