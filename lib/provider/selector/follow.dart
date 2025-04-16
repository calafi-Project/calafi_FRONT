import 'package:get/get.dart';

class FollowController extends GetxController{
  RxBool isSelector = false.obs;

  void changeOpen(){
    isSelector.value=true;
  }

  void changeClose(){
    isSelector.value=false;
  }
}