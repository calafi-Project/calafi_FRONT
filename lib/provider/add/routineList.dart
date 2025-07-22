import 'package:get/get.dart';

class RoutinelistController extends GetxController{
  RxList<int> list = <int>[].obs;

  void add(int id){
    list.add(id);
  }

  void delete(int id) {
    list.remove(id);
  }
}