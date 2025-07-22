import 'package:calafi/api/search/exerciseSearchApi.dart';
import 'package:calafi/models/exercise/exerciseSearch.dart';
import 'package:calafi/provider/token.dart';
import 'package:get/get.dart';

class ExerciseuploadController extends GetxController{
  RxList<ExerciseSearchModel> exerciseData = <ExerciseSearchModel>[].obs;
  final tokenController = Get.find<TokenController>();
  RxInt searchSelected = 0.obs;

  Future<void> search(String text) async{
    ExerciseSearchapi exerciseSearchapi = ExerciseSearchapi(searchTerm: text, token: tokenController.accessToken.value);
    exerciseData.value = await exerciseSearchapi.MyupdateApi_post();
  }
}