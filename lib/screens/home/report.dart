import 'package:calafi/components/footer/footer.dart';
import 'package:calafi/components/headers/header.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  final String text = '📌 운동 루틴: 개쩌는 등운동 루틴\n운동명: 데드리프트 80kg\n평균 심박수: 118 BPM\n📊 심박수 분석\n운동 중 변화\n1~3회: 68 → 82 BPM (가벼운 부담, 워밍업 단계)\n4~10회: 120 → 145 BPM (고강도 구간, 심박수 급상승)📌 운동 루틴: 개쩌는 등운동 루틴\n운동명: 데드리프트 80kg\n평균 심박수: 118 BPM\n📊 심박수 분석\n운동 중 변화\n1~3회: 68 → 82 BPM (가벼운 부담, 워밍업 단계)\n4~10회: 120 → 145 BPM (고강도 구간, 심박수 급상승)📌 운동 루틴: 개쩌는 등운동 루틴\n운동명: 데드리프트 80kg\n평균 심박수: 118 BPM\n📊 심박수 분석\n운동 중 변화\n1~3회: 68 → 82 BPM (가벼운 부담, 워밍업 단계)\n4~10회: 120 → 145 BPM (고강도 구간, 심박수 급상승)📌 운동 루틴: 개쩌는 등운동 루틴\n운동명: 데드리프트 80kg\n평균 심박수: 118 BPM\n📊 심박수 분석\n운동 중 변화\n1~3회: 68 → 82 BPM (가벼운 부담, 워밍업 단계)\n4~10회: 120 → 145 BPM (고강도 구간, 심박수 급상승)📌 운동 루틴: 개쩌는 등운동 루틴\n운동명: 데드리프트 80kg\n평균 심박수: 118 BPM\n📊 심박수 분석\n운동 중 변화\n1~3회: 68 → 82 BPM (가벼운 부담, 워밍업 단계)\n4~10회: 120 → 145 BPM (고강도 구간, 심박수 급상승)📌 운동 루틴: 개쩌는 등운동 루틴\n운동명: 데드리프트 80kg\n평균 심박수: 118 BPM\n📊 심박수 분석\n운동 중 변화\n1~3회: 68 → 82 BPM (가벼운 부담, 워밍업 단계)\n4~10회: 120 → 145 BPM (고강도 구간, 심박수 급상승)📌 운동 루틴: 개쩌는 등운동 루틴\n운동명: 데드리프트 80kg\n평균 심박수: 118 BPM\n📊 심박수 분석\n운동 중 변화\n1~3회: 68 → 82 BPM (가벼운 부담, 워밍업 단계)\n4~10회: 120 → 145 BPM (고강도 구간, 심박수 급상승)📌 운동 루틴: 개쩌는 등운동 루틴\n운동명: 데드리프트 80kg\n평균 심박수: 118 BPM\n📊 심박수 분석\n운동 중 변화\n1~3회: 68 → 82 BPM (가벼운 부담, 워밍업 단계)\n4~10회: 120 → 145 BPM (고강도 구간, 심박수 급상승)';
  final name = '정소울';
  final date = '2025-03-31';
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.gray50
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('$name 님의 심박수 보고서',style: AppTextStyles.M16.copyWith(color: AppColor.gray900),),
                          Text(date,style: AppTextStyles.M10.copyWith(color: AppColor.gray500),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.gray50
                      ),
                      child: Text(text,style: AppTextStyles.R14.copyWith(color: AppColor.gray900),),
                    ),
                  ),
                ],
              ),
            ),
            Footer(isClick: 1)
          ],
        ),
      ),
    );
  }
}