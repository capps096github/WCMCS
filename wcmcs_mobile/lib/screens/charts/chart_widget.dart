// ignore_for_file: public_member_api_docs, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../global/exporter.dart';
import 'chart_data.dart';

// ignore: public_member_api_docs
class CustomChart extends StatelessWidget {
  const CustomChart({
    required this.chartData,
    super.key,
    this.titleText = '',
    this.xAxisTitle = '',
    this.yAxisTitle = '',
    this.showLegend = false,
    this.legendTitle = '',
  });
  final List<ChartData> chartData;
  final String titleText;
  final String xAxisTitle;
  final String yAxisTitle;
  final bool showLegend;
  final String legendTitle;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      borderColor: Colors.blue,
      borderWidth: 2,
      legend:
          Legend(isVisible: showLegend, title: LegendTitle(text: legendTitle)),
      title: ChartTitle(text: titleText),
      primaryXAxis: CategoryAxis(title: AxisTitle(text: xAxisTitle)),
      primaryYAxis: NumericAxis(title: AxisTitle(text: yAxisTitle)),
      // ignore: strict_raw_type
      series: <CartesianSeries>[
        ColumnSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          dataLabelSettings:
              const DataLabelSettings(isVisible: true, color: appColor),
        ),
        LineSeries<ChartData, String>(
          dataSource: chartData,
          color: wcmcsGreen,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y1,
          dataLabelSettings:
              const DataLabelSettings(isVisible: true, color: wcmcsGreen),
        ),
      ],
    );
  }
// ignore: eol_at_end_of_file
}
