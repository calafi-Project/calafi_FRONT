import 'package:calafi/models/user/getUserModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../apiurl.dart';
class GetuserApi {
  final String token;
  // String  apiAddress = dotenv.get("APIURL");
  GetuserApi({required this.token});

  Future<UserModel> user_get() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/getUser/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return UserModel.fromJson(data);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

}