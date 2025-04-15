import 'package:calafi/components/search/widget/searchType.dart';
import 'package:calafi/config/app_color.dart';
import 'package:flutter/widgets.dart';

class SearchTop extends StatelessWidget {
  const SearchTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppColor.gray50
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Searchtype(text: '전체',ind: 0,),
              Searchtype(text: '운동',ind: 1,),
              Searchtype(text: '루틴',ind: 2,),
              Searchtype(text: '회원',ind: 3,),
            ],
          ),
        );
  }
}