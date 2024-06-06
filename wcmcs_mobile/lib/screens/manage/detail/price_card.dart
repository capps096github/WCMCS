import '../../../app_exporter.dart';
import 'detail_card.dart';

/// this displays the price card
class PriceCard extends ConsumerWidget {
  /// [PriceCard] constructor
  const PriceCard({
    required this.section,
    super.key,
  });

  /// section
  final Section section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// current app user
    final appUser = ref.watch(appUserProvider);

    // price = sectio litres * price per litre
    final price = section.litres * appUser.pricePerLitre;

    return DetailCard(
      cardColor: appColor,
      textColor: appColor,
      value: price,
      label: 'Price in UGX',
    );
  }
}
