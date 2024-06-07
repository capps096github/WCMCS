import '../../../app_exporter.dart';
import '../models/water_collected.dart';
import 'litres_card.dart';
import 'price_card.dart';
import 'section_chart.dart';

/// this displays the section information from cloud
class SectionDataBody extends StatelessWidget {
  /// [SectionDataBody] constructor
  const SectionDataBody({
    required this.section,
    required this.color,
    required this.waterCollected,
    super.key,
  });

  /// waterFlows
  final WaterCollected waterCollected;

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
        LitresCard(
          section: section,
          cardColor: color,
          waterCollected: waterCollected,
        ),
        const Spacing(of: spacing8),

        PriceCard(
          section: section,
          waterCollected: waterCollected,
        ),

        // spacing
        const Spacing(of: spacing32),

        // *
        BoldTitle(
          text: 'Daily Water Flow Overview',
          color: color,
          fontSize: 30,
        ),

        // section chart
        SectionChart(color: color, waterCollected: waterCollected),
      ],
    );
  }
}
