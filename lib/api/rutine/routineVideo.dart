import 'package:calafi/api/apiurl.dart';
import 'package:calafi/models/routine/routineDetails.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class GetRoutineDetailVideo{
  late String token;
  late String ids;
  // String  apiAddress = dotenv.get("APIURL");
  GetRoutineDetailVideo({required this.ids, required this.token});

  Future<List<RoutineDetailVideos>> GetcommentRoutine_post() async {
    Map<String, dynamic> postData = {
      'ids': ids,
    };

    try {
      final response = await http.post(
        Uri.parse('$apiUrl/routine/getdetail/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(postData),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => RoutineDetailVideos.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('에러 : $e');
      throw Exception('Error occurred: $e');
    }
  }
}
