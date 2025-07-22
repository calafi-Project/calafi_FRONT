import 'package:calafi/api/apiurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class actworkPost {
  late int work;
  late String token;
  // String  apiAddress = dotenv.get("APIURL");
  actworkPost({required this.work,required this.token});

  Future comment_post() async {
    Map<String, dynamic> postData = {
      'work': work,
    };

    try {
      await http.post(
        Uri.parse('$apiUrl/act/work/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(postData),
      );
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}