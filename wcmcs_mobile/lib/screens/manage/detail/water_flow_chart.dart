import 'package:flutter/material.dart';

import '../../charts/chart_data.dart';
import '../../charts/chart_widget.dart';

/// this displays the water flow chart
class WaterFlowChart extends StatelessWidget {
  /// [WaterFlowChart] constructor
  const WaterFlowChart({super.key});

  @override
  Widget build(BuildContext context) {
    final chartData = <ChartData>[
      ChartData('Jan', 35, 20),
      ChartData('Feb', 28, 32),
      ChartData('Mar', 34, 15),
      ChartData('Apr', 32, 25),
      ChartData('May', 40, 38),
    ];

    return SizedBox(
      height: 400,
      width: double.infinity,
      child: CustomChart(
        chartData: chartData,
        xAxisTitle: 'Months',
        yAxisTitle: 'Values in Liters',
        showLegend: true,
        legendTitle: 'Current Consumption: Series 0, Prediction: Series 1',
      ),
    );
  }
}
