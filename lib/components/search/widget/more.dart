import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchMore extends StatelessWidget {
  final searchController = Get.find<SeaController>();
  final int selector;
  SearchMore({required this.selector,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      searchController.changeClick(selector);
      },
      child: Padding(
        padding: const EdgeInsets.only(left:20,bottom: 24),
        child: Text('더보기',style: AppTextStyles.R14.copyWith(color: AppColor.gray400),),
      ),
    );
  }
}