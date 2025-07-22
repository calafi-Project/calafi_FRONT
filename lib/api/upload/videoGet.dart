import 'package:calafi/api/apiurl.dart';
import 'package:calafi/models/video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class GetVideo {
  late String token;
  late String searchTerm;
  // String  apiAddress = dotenv.get("APIURL");
  GetVideo({required this.searchTerm, required this.token});

  Future<List<ExerciseVideoModels>> GetcommentExercise_post() async {
    Map<String, dynamic> postData = {
      'searchTerm': searchTerm,
    };

    try {
      final response = await http.post(
        Uri.parse('$apiUrl/search/video/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(postData),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => ExerciseVideoModels.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
