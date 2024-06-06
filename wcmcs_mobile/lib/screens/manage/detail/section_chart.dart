import '../../../app_exporter.dart';
import '../models/water_flow.dart';
import 'water_flow_chart.dart';
import 'water_flow_data.dart';

/// this is the section chart
/// it has the date calendar at the top, the chart and collection times
class SectionChart extends StatelessWidget {
  /// [SectionChart] constructor
  const SectionChart({
    required this.color,
    required this.waterFlows,
    super.key,
  });

  /// water flows
  final List<WaterFlow> waterFlows;

  /// color
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacing(of: spacing8),
        // water flow chart
        const WaterFlowChart(),

        // spacing
        const Spacing(of: spacing32),
        BoldTitle(
          text: 'Details',
          color: color,
          fontSize: 30,
        ),
        const Spacing(of: spacing8),
        // water flow data
        WaterFlowData(
          color: color,
          waterFlows: waterFlows,
        ),
        const Spacing(of: spacing32),
      ],
    );
  }
}
