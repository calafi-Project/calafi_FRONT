import 'package:calafi/provider/token.dart';
import 'package:get/get.dart';
import 'package:calafi/models/SearchModel.dart';
import 'package:calafi/api/search/searchApi.dart';

class SearchModelController extends GetxController {
  Rxn<SearchModel> result = Rxn<SearchModel>();
  RxString searchText="".obs;

  void setResult(SearchModel data) {
    result.value = data;
  }

  void clear() {
    result.value = null;
  }

  void searchapi() async{
    try{
      final tokenController = Get.find<TokenController>();
      late Searchapi searchapi;
      print(searchText.value);
      late SearchModel searchResult;
      searchapi = Searchapi(searchTerm: searchText.value, token: tokenController.accessToken.value);
      searchResult=await searchapi.MyupdateApi_post();
      setResult(searchResult);
    }catch(err){
      print("검색 에러 발생");
    }

  }
}
