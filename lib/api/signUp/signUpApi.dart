import 'package:http/http.dart' as http;
import 'dart:convert';

class Signupapi {
  late int age;
  late int height;
  late String name;
  late String password;
  late int weight;
  late String email;

  Signupapi({required this.age,required this.height,required this.name,required this.password,required this.weight, required this.email});

  Future<bool> Signup_post() async {
    Map<String, dynamic> postData = {
      'age': age,
      'height': height,
      'name': name,
      'password': password,
      'weight': weight,
      'email': email,
    };

    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/sign/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(postData),
      );

      print('응답 상태: ${response.statusCode}');
      print('응답 본문: ${response.body}');

      if (response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('에러 : $e');
      throw Exception('Error occurred: $e');
    }
  }

}