import 'package:calafi/api/apiurl.dart';
import 'package:calafi/models/exercise/exerciseCommentModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class GetcommentRoutine{
  late String token;
  late int exercise_id;
  // String  apiAddress = dotenv.get("APIURL");
  GetcommentRoutine({required this.exercise_id, required this.token});

  Future<List<ExerciseComment>> GetcommentRoutine_post() async {
    Map<String, dynamic> postData = {
      'routine_id': exercise_id,
    };

    try {
      final response = await http.post(
        Uri.parse('$apiUrl/routine/getcomment/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(postData),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => ExerciseComment.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('에러 : $e');
      throw Exception('Error occurred: $e');
    }
  }
}
