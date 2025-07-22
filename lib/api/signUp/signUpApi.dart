import 'package:calafi/api/apiurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class Signupapi {
  late int age;
  late int height;
  late String name;
  late String password;
  late int weight;
  late String email;
  // String  apiAddress = dotenv.get("APIURL");
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
        Uri.parse('$apiUrl/sign/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(postData),
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}