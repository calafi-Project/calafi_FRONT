import 'package:calafi/api/rutine/weekGetRoutine.dart';
import 'package:calafi/models/routine/weekRoutine.dart';
import 'package:calafi/provider/token.dart';
import 'package:get/get.dart';

class WeekroutineController extends GetxController {
  RxList<WeekRoutineModel> getFollowingData = <WeekRoutineModel>[].obs;

  Future<void> weekapi(int day) async{
    final tokenController = Get.find<TokenController>();
    late List<WeekRoutineModel> weekData;
    final WeekGetRoutine weekGetRoutine = WeekGetRoutine(weekday: day, token: tokenController.accessToken.value);
    weekData = await weekGetRoutine.Getroutine_post();
    getFollowingData.value=weekData;
  }
}
