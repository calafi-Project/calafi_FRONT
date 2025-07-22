import 'package:calafi/models/user/getUserModel.dart';
import 'package:get/get.dart';


// GetX 컨트롤러
class UserController extends GetxController {
  RxInt id = 0.obs;
  RxString email = ''.obs;
  RxString name = ''.obs;
  RxInt age = 0.obs;
  RxInt height = 0.obs;
  RxInt weight = 0.obs;
  RxnString profileImage = RxnString(null);
  RxInt grade = 0.obs;
  RxInt workTime = 0.obs;
  RxInt completeRoutine = 0.obs;
  RxInt caloriBurned = 0.obs;
  RxInt isRoutine = 0.obs;
  RxInt isWorkout = 0.obs;

  void setUserActivity(UserModel user) {
    id.value = user.id;
    email.value = user.email;
    name.value = user.name;
    age.value = user.age;
    height.value = user.height;
    weight.value = user.weight;
    profileImage.value = user.profileImage;
    grade.value = user.grade;
    workTime.value = user.workTime;
    completeRoutine.value = user.completeRoutine;
    caloriBurned.value = user.caloriBurned;
    isRoutine.value = user.isRoutine;
    isWorkout.value = user.isWorkout;
  }
}