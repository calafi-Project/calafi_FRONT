import 'package:calafi/api/apiurl.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class Isworkupdate {
  final String token;
  Isworkupdate({required this.token});
  // String  apiAddress = dotenv.get("APIURL");
  Future<void> Update_Post() async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/update/IsWorkout/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
      );
      print('응답 상태: ${response.statusCode}');
      print('응답 본문: ${response.body}');
    } catch (e) {
      print('에러 : $e');
      throw Exception('Error occurred: $e');
    }
  }
}