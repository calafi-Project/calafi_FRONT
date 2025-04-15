import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calafi/provider/search.dart';

class Searchtype extends StatelessWidget {

  final searchController = Get.find<SeaController>();

  final String text;
  final int ind;

  Searchtype({required this.ind,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        searchController.changeClick(ind);
      },
      child: IntrinsicWidth(
        child: Column(
          children: [
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Obx(()=>Text(
                text,
                style: searchController.isClick[ind]
                    ? AppTextStyles.S18.copyWith(color: AppColor.gray900)
                    : AppTextStyles.M18.copyWith(color: AppColor.gray400),
              ),)
            ),
            SizedBox(height: 12),
            Obx(()=>searchController.isClick[ind]?
              Container(
                height: 2,
                decoration: BoxDecoration(
                  color: AppColor.gray900,
                  borderRadius: BorderRadius.circular(20),
                ),
              ):SizedBox(),
            )
          ],
        ),
      ),
    );

  }
}