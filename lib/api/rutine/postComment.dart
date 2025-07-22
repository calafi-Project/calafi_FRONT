import 'package:calafi/api/apiurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class RoutineCommentPost {
  late int routine_id;
  late String content;
  late String token;
  // String  apiAddress = dotenv.get("APIURL");
  RoutineCommentPost({required this.routine_id,required this.content,required this.token});

  Future comment_post() async {
    Map<String, dynamic> postData = {
      'routine_id': routine_id,
      'content': content,
    };

    try {
      await http.post(
        Uri.parse('$apiUrl/routine/comment/'),
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