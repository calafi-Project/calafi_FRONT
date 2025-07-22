import 'package:calafi/api/apiurl.dart';
import 'package:calafi/models/user/getfollowModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class Getfollowuser {
  final String token;
  final int id;
  // String  apiAddress = dotenv.get("APIURL");
  Getfollowuser({required this.id,required this.token});

  Future<List<getUserFollowModel>> GetFollowing_get() async {
    Map<String, dynamic> postData = {'myId': id};

    try {
      final response = await http.post(
        Uri.parse('$apiUrl/follow/getfollowing/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(postData),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data
            .map((json) => getUserFollowModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }


  Future<List<getUserFollowModel>> GetFollow_get() async {
    Map<String, dynamic> postData = {'myId': id};

    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/follow/getfollow/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(postData),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data
            .map((json) => getUserFollowModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

}