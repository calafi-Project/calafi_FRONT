import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

//나중에 연결 할 때는 변수로 값을 받아서 ㄱㄱ
class WeightChart extends StatelessWidget {
  final List<double> weights = [70, 69, 67, 66];
  final List<String> dates = ['03.01', '03.07', '03.14', '03.21'];
  final double targetWeight = 64;

  @override
  Widget build(BuildContext context) {
    final double minWeight = weights.reduce((a, b) => a < b ? a : b) - 5;
    final double maxWeight = weights.reduce((a, b) => a > b ? a : b) + 5;

    // 필요한 인덱스 계산
    List<int> getLabelIndexes(int length) {
      if (length <= 4) {
        return List.generate(length, (index) => index);
      } else {
        return [
          0,
          (length * 0.25).floor(),
          (length * 0.5).floor(),
          length - 1,
        ];
      }
    }

    List<int> labelIndexes = getLabelIndexes(dates.length);

    return AspectRatio(
      aspectRatio: 1.6,
      child: LineChart(
        LineChartData(
          minY: minWeight,
          maxY: maxWeight,
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) => Text(
                  value.toInt().toString(),
                  style: AppTextStyles.R12.copyWith(color: AppColor.gray500),
                ),
                interval: 5,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  int index = value.toInt();
                  if (labelIndexes.contains(index) && index < dates.length) {
                    return Text(
                      dates[index],
                      style: AppTextStyles.R12.copyWith(color: AppColor.gray900),
                    );
                  }
                  return SizedBox(); // 그 외는 빈칸
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                weights.length,
                (index) => FlSpot(index.toDouble(), weights[index]),
              ),
              isCurved: true,
              barWidth: 2,
              color: AppColor.red,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(show: false),
            ),
          ],
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: targetWeight,
                color: AppColor.blue,
                dashArray: [8, 4],
                strokeWidth: 1.5,
                label: HorizontalLineLabel(
                  show: true,
                  alignment: Alignment.bottomRight,
                  labelResolver: (line) => '목표 체중 : ${targetWeight.toInt()}kg',
                  style:AppTextStyles.R12.copyWith(color: AppColor.gray500),
                ),
              ),
            ],
          ),
          lineTouchData: LineTouchData(enabled: false),
        ),
      ),
    );
  }
}
