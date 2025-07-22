import 'package:calafi/api/apiurl.dart';
import 'package:calafi/models/SearchModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class Searchapi {
  late String searchTerm;
  final String token;
  // String  apiAddress = dotenv.get("APIURL");
  Searchapi({required this.searchTerm,required this.token});

  Future<SearchModel> MyupdateApi_post() async {
    Map<String, dynamic> postData = {
      'searchTerm': searchTerm,
    };

    try {
      final response = await http.post(
        Uri.parse('$apiUrl/search/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(postData),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return SearchModel.fromJson(data);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('에러 : $e');
      throw Exception('Error occurred: $e');
    }
  }

}