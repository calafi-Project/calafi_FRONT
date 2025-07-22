import 'package:calafi/api/apiurl.dart';
import 'package:calafi/models/exercise/exerciseDetail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class Getexercisedetailapi {
  late String id;
  final String token;
  // String  apiAddress = dotenv.get("APIURL");
  Getexercisedetailapi({required this.id,required this.token});

  Future<ExerciseDetail> Getexercisedetailapi_post() async {

    try {
      final response = await http.get(
        Uri.parse('$apiUrl/exercise/$id'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ExerciseDetail.fromJson(data);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

}