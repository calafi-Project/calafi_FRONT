import 'package:calafi/api/apiurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
class Addroutinetovideos {
  late String videoIds,count;
  late int routineId;
  late String token;
  // String  apiAddress = dotenv.get("APIURL");
  Addroutinetovideos({required this.routineId,required this.videoIds,required this.count,required this.token});

  Future routinePost() async {
    Map<String, dynamic> postData = {
      'routineId': routineId,
      'videoIds': videoIds,
      'count':count
    };

    try {
      await http.post(
        Uri.parse('$apiUrl/routine/addVideosToRoutine/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(postData),
      );
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}