import 'package:calafi/api/apiurl.dart';
import 'package:calafi/models/accessToken.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class Loginapi {
  late String password;
  late String email;
  // String  apiAddress = dotenv.get("APIURL");
  Loginapi({required this.password,required this.email});

  Future<Accesstoken> Login_post() async {
    Map<String, dynamic> postData = {
      'password': password,
      'email': email,
    };

    try {
      final response = await http.post(
        Uri.parse('$apiUrl/login/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(postData),
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Accesstoken.fromJson(data);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('에러 : $e');
      throw Exception('Error occurred: $e');
    }
  }

}