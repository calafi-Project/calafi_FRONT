import 'package:calafi/api/act/kcal.dart';
import 'package:calafi/api/act/routine.dart';
import 'package:calafi/api/act/time.dart';
import 'package:calafi/api/rutine/routinecount.dart';
import 'package:calafi/models/workList.dart';
import 'package:calafi/provider/token.dart';
import 'package:get/get.dart';

class Routinecomplete extends GetxController{
  RxInt todaysRoutine = 0.obs;
  RxInt completeRoutine = 0.obs;
  RxInt percent = 0.obs;
  RxInt time = 0.obs;
  RxList<Worklist> worklist =<Worklist>[].obs;
  
  final tokenController = Get.find<TokenController>();

  Future<void> setTime(int gettime)async{
    time.value= gettime;
    actKcalPost actkcal = actKcalPost(calori: gettime*3,token: tokenController.accessToken.value);
    await actkcal.comment_post();

    actworkPost actwork = actworkPost(work: gettime, token: tokenController.accessToken.value);
    await actwork.comment_post();

    actroutinePost actroutine = actroutinePost(token:  tokenController.accessToken.value);
    await actroutine.comment_post();
  }

  Future<void> getCount()async{
    RoutineCountPost routineCountPost = RoutineCountPost(weekday: getKoreaWeekdayIndex(), token: tokenController.accessToken.value);
    todaysRoutine.value = await routineCountPost.comment_post();
    print(todaysRoutine);
  }

  int getKoreaWeekdayIndex() {
    final now = DateTime.now().toUtc().add(Duration(hours: 9));
    int weekday = now.weekday;

    return weekday;
  }
}