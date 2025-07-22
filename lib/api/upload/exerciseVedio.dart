import 'package:calafi/api/apiurl.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ExercisevedioPost {
  final String title, token;
  final XFile videourl;
  final int exerciseid;

  ExercisevedioPost({
    required this.exerciseid,
    required this.token,
    required this.title,
    required this.videourl,
  });

  Future<bool> exerciseVideoPost() async {
    final uri = Uri.parse('$apiUrl/exercise/addVideo/');

    final request = http.MultipartRequest('POST', uri)
      ..headers['Authorization'] = token
      ..fields['title'] = title
      ..fields['exercise_id'] = exerciseid.toString()
      ..files.add(await http.MultipartFile.fromPath(
        'video',
        videourl.path,
        filename: basename(videourl.path),
      ));

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        return true;
      } else {
        print('❌ 업로드 실패: ${response.statusCode} ${response.body}');
        return false;
      }
    } catch (e) {
      print('🚨 예외 발생: $e');
       return false;
    }
  }
}
