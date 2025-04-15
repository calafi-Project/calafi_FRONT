import 'package:get/get.dart';

class FooterController extends GetxController{
  RxInt isClick = 0.obs;

  void changeClick(int ind){
    isClick.value=ind;
  }
}