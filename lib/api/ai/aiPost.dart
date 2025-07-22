import 'dart:convert';
import 'package:calafi/models/workList.dart';
import 'package:http/http.dart' as http;
import 'package:calafi/api/apiurl.dart';

class ActKcalPost {
  final int height;
  final int weight;
  final int workoutTime;
  final List<Map<String, dynamic>> workoutList;
  ActKcalPost({
    required this.height,
    required this.weight,
    required this.workoutTime,
    required this.workoutList,
  });

  Future<String> sendWorkoutData() async {
    final uri = Uri.parse('$apiUrl/gemini');

    Map<String, dynamic> postData = {
      'height': height,
      'weight': weight,
      'workoutTime': workoutTime,
      'workoutList': workoutList,
    };

    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(postData),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final report = data;
        print("AI Report: $report");
        return report;
      } else {
        throw Exception('Gemini 응답 오류: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('오류 발생: $e');
    }
  }
}
