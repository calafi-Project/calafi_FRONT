import 'package:calafi/api/apiurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class Weekdeleteroutine {
  late int routineId,weekday;
  late String token;
  // String  apiAddress = dotenv.get("APIURL");
  Weekdeleteroutine({required this.routineId,required this.weekday,required this.token});

  Future comment_post() async {
    Map<String, dynamic> postData = {
      'routineId': routineId,
      'weekday':weekday,
    };

    try {
      await http.delete(
        Uri.parse('$apiUrl/routine/reRoSc/'),
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