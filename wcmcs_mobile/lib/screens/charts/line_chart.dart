
// ignore_for_file: public_member_api_docs

import '../../wcmcs_exporter.dart';
import 'chart_data.dart';
import 'chart_widget.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chartData = <ChartData>[
      ChartData('Jan', 35, 20),
      ChartData('Feb', 28, 32),
      ChartData('Mar', 34, 15),
      ChartData('Apr', 32, 25),
      ChartData('May', 40, 38),
    ];

    return Scaffold(
      body: Center(
        child: CustomChart(
          chartData: chartData,
          titleText: 'Water Consumption Analysis',
          xAxisTitle: 'Months',
          yAxisTitle: 'Values in Liters',
          showLegend: true,
          legendTitle: 'Current Consumption: Series 0, Prediction: Series 1',
        ),
      ),
    );
  }
// ignore: eol_at_end_of_file
}