import 'package:calafi/api/apiurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class MyupdateApi {
  late int height;
  late int weight;
  // String  apiAddress = dotenv.get("APIURL");
  final String token;
  MyupdateApi({required this.height,required this.weight,required this.token});

  Future<void> MyupdateApi_post() async {
    Map<String, dynamic> postData = {
      'height': height,
      'weight': weight,
    };

    try {
      await http.post(
        Uri.parse('$apiUrl/updatePhsical/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(postData),
      );
    } catch (e) {
      print('에러 : $e');
      throw Exception('Error occurred: $e');
    }
  }

}