import 'package:calafi/api/apiurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
class RoutineCountPost {
  late int weekday;
  late String token;
  
  // String  apiAddress = dotenv.get("APIURL");
  RoutineCountPost({required this.weekday,required this.token});

  Future<int> comment_post() async {
    Map<String, dynamic> postData = {
      'weekday': weekday,
    };

    try {
      final respose = await http.post(
        Uri.parse('$apiUrl/routine/count/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(postData),
      );
      if (respose.statusCode == 200) {
        final int data = jsonDecode(respose.body);
        return data;
      }else{
        print(respose.statusCode);
        return 0;
      }
      
    } catch (e) {
      print('에러 : $e');
      throw Exception('Error occurred: $e');
    }
  }
}