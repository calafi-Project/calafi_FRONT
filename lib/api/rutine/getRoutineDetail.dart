import 'package:calafi/api/apiurl.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:calafi/models/routine/rutineDetail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetroutineDetail {
  late String id;
  final String token;
  // String  apiAddress = dotenv.get("APIURL");
  GetroutineDetail({required this.id,required this.token});

  Future<List<RoutineDetailItem>> GetroutineDetail_post() async {
    Map<String, dynamic> postData = {
      'routineId': id,
    };
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/routine/detail/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(postData),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        
        return data.map((e) => RoutineDetailItem.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

}