import 'package:calafi/models/user/getCreate.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../apiurl.dart';
class GetCreateUser {
  final String token;
  // String  apiAddress = dotenv.get("APIURL");
  GetCreateUser({required this.token});

  Future<CreateUser> create_get() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/routine/joinExerciseRoutine/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return CreateUser.fromJson(data);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}