import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../manage/models/water_collected.dart';

/// shows bar chart of all water values collected
class CustomChart extends StatelessWidget {
  /// [CustomChart] constructor
  const CustomChart({
    required this.waterChartData,
    required this.xAxisTitle,
    required this.yAxisTitle,
    required this.color,
    super.key,
  });

  /// chart data
  final List<WaterChartData> waterChartData;

  ///x-axis title text
  final String xAxisTitle;

  /// y-axis title text
  final String yAxisTitle;

  /// color
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(title: AxisTitle(text: xAxisTitle)),
      primaryYAxis: NumericAxis(title: AxisTitle(text: yAxisTitle)),
      // ignore: strict_raw_type
      series: <CartesianSeries>[
        ColumnSeries<WaterChartData, String>(
          dataSource: waterChartData,
          color: color,
          xValueMapper: (WaterChartData data, _) => data.x,
          yValueMapper: (WaterChartData data, _) => data.y,
          // dataLabelSettings: const DataLabelSettings(
          //   isVisible: true,
          //   color: appBlack,
          //   textStyle: TextStyle(
          //     fontSize: 12,
          //     color: appWhite,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ),
        // LineSeries<ChartData, String>(
        //   dataSource: chartData,
        //   color: appGreen,
        //   xValueMapper: (ChartData data, _) => data.x,
        //   yValueMapper: (ChartData data, _) => data.y1,
        //   dataLabelSettings:
        //       const DataLabelSettings(isVisible: true, color: appGreen),
        // ),
      ],
    );
  }
// ignore: eol_at_end_of_file
}
