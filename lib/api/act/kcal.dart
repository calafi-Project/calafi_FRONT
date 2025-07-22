import 'package:calafi/api/apiurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class actKcalPost {
  late int calori;
  late String token;
  // String  apiAddress = dotenv.get("APIURL");
  actKcalPost({required this.calori,required this.token});

  Future comment_post() async {
    Map<String, dynamic> postData = {
      'calori': calori,
    };

    try {
      await http.post(
        Uri.parse('$apiUrl/act/calori/'),
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