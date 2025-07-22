import 'package:calafi/api/upload/videoGet.dart';
import 'package:calafi/models/video.dart';
import 'package:calafi/provider/token.dart';
import 'package:get/get.dart';

class VideoController extends GetxController{
  RxString videoIds = ''.obs;
  RxString count = ''.obs;

  RxString name = ''.obs;
  RxString descript = ''.obs;
  RxString tag = ''.obs;

  RxList<ExerciseVideoModels> exerciseData = <ExerciseVideoModels>[].obs;
  final tokenController = Get.find<TokenController>();
  RxInt searchSelected = 0.obs;

  Future<void> search(String text) async{
    
    GetVideo exerciseSearchapi = GetVideo(searchTerm: text, token: tokenController.accessToken.value);
    exerciseData.value = await exerciseSearchapi.GetcommentExercise_post();
  }

  void addVideoId() {
    if (videoIds.value.isEmpty) {
      videoIds.value = '${searchSelected.value}';
    } else {
      videoIds.value += ',${searchSelected.value}';
    }
  }

  void clear(){
    videoIds.value = '';
    count.value = '';
    name.value = '';
    descript.value = '';
    tag.value = '';
    searchSelected.value = 0;
  }

  void addCount(String cnt) {
    if (count.value.isEmpty) {
      count.value = '$cnt';
    } else {
      count.value += ',$cnt';
    }
  }
  
  String getCountByIndex(int index) {
    final counts = count.value.split(',');
    if (index >= 0 && index < counts.length) {
      return counts[index];
    } else {
      return '0'; // 범위를 벗어나면 기본값
    }
  }
}