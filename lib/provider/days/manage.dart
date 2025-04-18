import 'package:get/get.dart';

class ManageDaysController extends GetxController{
  RxList<bool> isClick = [true, false, false, false, false, false, false].obs;
  RxString day = ''.obs;
  void changeClick(int ind){

    for(int i=0;i<7;i++){
      isClick[i]=false;
    }

    if(ind==0){
      day.value = '월요일';
    }
    else if(ind==1){
      day.value='화요일';
    }
    else if(ind==2){
      day.value='수요일';
    }
    else if(ind==3){
      day.value='목요일';
    }
    else if(ind==4){
      day.value='금요일';
    }
    else if(ind==5){
      day.value='토요일';
    }
    else if(ind==6){
      day.value='일요일';
    }

    isClick[ind]=true;
  }
}