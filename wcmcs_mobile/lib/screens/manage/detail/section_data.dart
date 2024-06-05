import '../../../app_exporter.dart';
import '../models/water_flow.dart';
import 'litres_card.dart';
import 'price_card.dart';
import 'water_flow_chart.dart';
import 'water_flow_data.dart';

/// this displays the section information from cloud
class SectionData extends StatelessWidget {
  /// [SectionData] constructor
  const SectionData({
    required this.section,
    required this.color,
    required this.waterFlows,
    super.key,
  });

  /// waterFlows
  final List<WaterFlow> waterFlows;

  /// section
  final Section section;

  /// color
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding16,
      children: [
        BoldTitle(
          text: 'Summary',
          color: color,
          fontSize: 30,
        ),
        const Spacing(of: spacing8),
        //  litres and price cards in a row
        Row(
          children: [
            // litres card
            Expanded(
              child: LitresCard(
                section: section,
                cardColor: color,
              ),
            ),
            const Spacing(of: spacing16),
            // price card
            Expanded(
              child: PriceCard(section: section),
            ),
          ],
        ),

        // spacing
        const Spacing(of: spacing32),

        // *
        BoldTitle(
          text: 'Water Flow Overview',
          color: color,
          fontSize: 30,
        ),
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
        // water flow chart
        WaterFlowData(
          color: color,
          waterFlows: waterFlows,
        ),
        const Spacing(of: spacing32),
      ],
    );
  }
}
