import 'package:calafi/models/user/getFollows.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../apiurl.dart';

class Countfollow {
  final int id;
  // String  apiAddress = dotenv.get("APIURL");
  Countfollow({required this.id});


  Future<GetfollowsModel> user_get() async {
    Map<String, dynamic> postData = {
      'userId': id,
    };
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/follow/count/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:jsonEncode(postData),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return GetfollowsModel.fromJson(data);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

}