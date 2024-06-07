import '../../../app_exporter.dart';
import '../models/water_collected.dart';
import 'detail_card.dart';

/// this displays the price card
class PriceCard extends ConsumerWidget {
  /// [PriceCard] constructor
  const PriceCard({
    required this.section,
    required this.waterCollected,
    super.key,
  });

  /// section
  final Section section;

  /// waterFlows
  final WaterCollected waterCollected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// current app user
    final appUser = ref.watch(appUserProvider);

    return DetailCard(
      cardColor: appColor,
      textColor: appColor,
      value: waterCollected.getPrice(appUser.pricePerLitre),
      label: 'Price in UGX',
      description: '* Price per litre: UGX ${appUser.pricePerLitre}',
    );
  }
}
