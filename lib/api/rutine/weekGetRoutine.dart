import 'package:calafi/api/apiurl.dart';
import 'package:calafi/models/routine/weekRoutine.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class WeekGetRoutine {
  late int weekday;
  final String token;
  // String  apiAddress = dotenv.get("APIURL");
  WeekGetRoutine({required this.weekday,required this.token});

  Future<List<WeekRoutineModel>> Getroutine_post() async {
    Map<String, dynamic> postData = {
      'weekday': weekday,
    };
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/routine/getRoSc/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(postData),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((e) => WeekRoutineModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

}