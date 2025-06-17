import 'package:calafi/models/accessToken.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loginapi {
  late String password;
  late String email;

  Loginapi({required this.password,required this.email});

  Future<Accesstoken> Login_post() async {
    Map<String, dynamic> postData = {
      'password': password,
      'email': email,
    };

    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/login/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(postData),
      );

      print('응답 상태: ${response.statusCode}');
      print('응답 본문: ${response.body}');

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