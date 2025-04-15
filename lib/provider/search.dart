import 'package:get/get.dart';

class SeaController extends GetxController {
  List<bool> isClick=[true,false,false,false].obs;
  RxInt selector = 0.obs;

  void changeClick(int check){
    isClick[0]=false;
    isClick[1]=false;
    isClick[2]=false;
    isClick[3]=false;
    isClick[check]=true;
    
    if (isClick[0]) {
      selector.value = 0;
    } else if (isClick[1]) {
      selector.value = 1;
    } else if (isClick[2]) {
      selector.value = 2;
    } else if (isClick[3]) {
      selector.value = 3;
    } else {
      selector.value = 4;
    }
  }
}