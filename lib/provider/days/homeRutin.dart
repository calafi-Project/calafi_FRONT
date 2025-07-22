import 'package:get/get.dart';

class HomeDayRutinController extends GetxController{
  RxList<bool> isClick = [true, false, false, false, false, false, false].obs;
  RxString day = '월요일'.obs;
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

  int GetClick(){
    if(isClick[0]==true){
      return 1;
    }
    else if(isClick[1]==true){
      return 2;
    }
    else if(isClick[2]==true){
      return 3;
    }
    else if(isClick[3]==true){
      return 4;
    }
    else if(isClick[4]==true){
      return 5;
    }
    else if(isClick[5]==true){
      return 6;
    }
    else if(isClick[6]==true){
      return 7;
    }

    return 0;
  }
}