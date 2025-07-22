import 'package:calafi/api/apiurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class AddRoutinePost {
  late String name,description,tags;
  late String token;
  // String  apiAddress = api.get("APIURL");
  AddRoutinePost({required this.name,required this.description,required this.tags,required this.token});

  Future<int> routinePost() async {
    Map<String, dynamic> postData = {
      'name': name,
      'description': description,
      'tags': tags,
    };

    try {
      final response = await http.post(
        Uri.parse('$apiUrl/routine/createRoutine/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(postData),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return data['routine_id'];  // 서버에서 받은 루틴 id 반환
      } else {
        throw Exception('Failed to create routine: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}