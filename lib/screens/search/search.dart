import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/search/widget/search.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/screens/search/searched.dart';
import 'package:calafi/screens/search/searching.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bool isSearched=false;
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
                  Search(controller: searchController,),
                  //나중에 이건 입력 검색 api가 호출 됬을 때로 ㄱㄱ
                  
                  Expanded(
                    child: isSearched?
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