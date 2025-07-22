import 'package:calafi/components/home/home/waterInput.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/provider/db/waterController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Water extends StatefulWidget {
  final int hope, now;
  const Water({required this.hope, required this.now, super.key});

  @override
  State<Water> createState() => _WaterState();
}

class _WaterState extends State<Water> {
  bool isSetting = false;
  final cupController = TextEditingController();
  final hopeController = TextEditingController();
  final waterController = Get.find<WaterController>();

  Widget _buildSettingView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Waterinput(controller: cupController, ex: 'ex) 150', title: '컵 용량'),
            SizedBox(width: 8),
            Waterinput(controller: hopeController, ex: 'ex) 1550', title: '목표 설정'),
          ],
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () async{
            setState(() => isSetting = false);
            await waterController.updateGoalStep(int.parse(hopeController.text), int.parse(cupController.text));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColor.red,
            ),
            child: Text('수정', style: AppTextStyles.M16.copyWith(color: AppColor.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildDisplayView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icon/week/cup.svg'),
                SizedBox(width: 4),
                Text('${widget.now}ml ', style: AppTextStyles.M16.copyWith(color: AppColor.gray900)),
                Text('/', style: AppTextStyles.R16.copyWith(color: AppColor.gray500)),
                Text('${widget.hope}ml', style: AppTextStyles.R14.copyWith(color: AppColor.gray500)),
              ],
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: ()async{
                await waterController.addWater();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColor.red,
                ),
                child: Text('+ ${waterController.waterData.value!.step}ml', style: AppTextStyles.M16.copyWith(color: AppColor.white)),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: (){
            setState(() => isSetting = true);
          },
          child: SvgPicture.asset('assets/icon/week/water.svg')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.16),
              offset: Offset(0, 1),
              blurRadius: 4,
            ),
          ],
        ),
        child: isSetting ? _buildSettingView() : _buildDisplayView(),
      ),
    );
  }
}
