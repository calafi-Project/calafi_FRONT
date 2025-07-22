import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/sear.dart';
import 'package:calafi/screens/search/searched.dart';
import 'package:calafi/screens/search/searching.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final getSearchController = Get.find<SearchModelController>();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.gray50,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColor.gray200,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: searchController,
                              style: AppTextStyles.R16.copyWith(color: AppColor.gray900),
                              decoration: InputDecoration(
                                    hintText: '운동, 루틴, 회원 검색',
                                    hintStyle: AppTextStyles.R16.copyWith(color: AppColor.gray400,letterSpacing: 0),
                                        border: InputBorder.none, // 기본 밑줄 제거
                                        enabledBorder: InputBorder.none, // 활성화 상태 밑줄 제거
                                        focusedBorder: InputBorder.none, // 포커스 시 밑줄 제거
                                        disabledBorder: InputBorder.none, // 비활성화 상태 밑줄 제거
                                        // contentPadding: EdgeInsets.zero, // 내부 패딩 조정 (선택사항)
                                  ),
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    searchController.text='';
                                  });
                                  getSearchController.clear();
                                },
                                child: SvgPicture.asset('assets/icon/search/cancel.svg')
                              ),
                              SizedBox(width: 10,),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    searchController.text=searchController.text;
                                  });
                                  getSearchController.searchText.value=searchController.text;
                                  getSearchController.searchapi();
                                },
                                child: SvgPicture.asset('assets/icon/search/search.svg')
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  
                  //나중에 이건 입력 검색 api가 호출 됬을 때로 ㄱㄱ
                  
                  Expanded(
                    child: searchController.text.isEmpty?
                    Searching():Searched(),
                  )
                ],
              ),
            ),
            Footer(isClick: 2,)
          ],
        ),
      ),
    );
  }
}