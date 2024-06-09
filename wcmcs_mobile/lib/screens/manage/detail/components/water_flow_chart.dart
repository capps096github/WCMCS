import '../../../../app_exporter.dart';
import '../../../charts/chart_widget.dart';
import '../../models/water_collected.dart';

/// this displays the water flow chart
class WaterFlowChart extends StatelessWidget {
  /// [WaterFlowChart] constructor
  const WaterFlowChart({
    required this.waterCollected,
    required this.color,
    super.key,
  });

  /// water collected
  final WaterCollected waterCollected;

  /// color
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius8,
        border: Border.all(
          color: color,
          width: 2,
        ),
      ),
      child: CustomChart(
        waterChartData: waterCollected.chartData,
        xAxisTitle: 'Time',
        yAxisTitle: 'Litres',
        color: color,
      ),
    );
  }
}
