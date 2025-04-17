import 'package:get/get.dart';

class MyManageController extends GetxController{
  RxBool isSelector = false.obs;

  void changeOpen(){
    isSelector.value=true;
  }

  void changeClose(){
    isSelector.value=false;
  }
}