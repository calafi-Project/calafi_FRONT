import 'package:calafi/api/apiurl.dart';
import 'package:calafi/models/user/getUserOverrviwe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class Useroverrview {
  final int id;
  final String token;
  // String  apiAddress = dotenv.get("APIURL");
  Useroverrview({required this.id,required this.token});


  Future<UserOverview> user_post() async {
    Map<String, dynamic> postData = {
      'userId': id,
    };
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/user/getUser/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body:jsonEncode(postData),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return UserOverview.fromJson(data);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

}