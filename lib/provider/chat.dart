import 'package:get/get.dart';

class ChatController extends GetxController{
  RxBool isOpen = false.obs;

  void changeOpen(){
    isOpen.value=true;
  }

  void changeClose(){
    isOpen.value=false;
  }
}