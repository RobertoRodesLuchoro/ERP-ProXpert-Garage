import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Chart extends StatelessWidget {
  final bool isDark;

  const Chart({
    Key? key,
    required this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? Colors.white : Colors.black;

    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: pieChartSectionData,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding),
                Text(
                  "+11.732 €",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    height: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> pieChartSectionData = [
  PieChartSectionData(
    color: Color(0xFF22C55E),
    value: 34,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: Color(0xFFEE2727),
    value: 11,
    showTitle: false,
    radius: 22,
  ),
];
