import '../../../../app_exporter.dart';
import '../../models/water_collected.dart';
import 'detail_card.dart';

/// shows the litres of a section
class LitresCard extends StatelessWidget {
  /// [LitresCard] constructor
  const LitresCard({
    required this.section,
    required this.cardColor,
    required this.waterCollected,
    super.key,
  });

  /// section
  final Section section;

  /// color
  final Color cardColor;


  /// waterFlows
  final WaterCollected waterCollected;


  @override
  Widget build(BuildContext context) {
    return DetailCard(
      cardColor: cardColor,
      textColor: cardColor,
      value: waterCollected.totalLitres,
      label: 'Litres Used Today',
      description: '* Estimated',
    );
  }
}
