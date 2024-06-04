import '../../../app_exporter.dart';
import '../models/home_card_item.dart';

/// this is the label for the card
class CardLabel extends StatelessWidget {
  /// [CardLabel] constructor
  const CardLabel({
    required this.cardItem,
    super.key,
  });

  /// card item to display
  final HomeCardItem cardItem;

  @override
  Widget build(BuildContext context) {
    const textColor = appWhite;

    return Padding(
      padding: padding16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          Text(
            cardItem.label,
            style: const TextStyle(
              color: textColor,
              fontSize: fontSize18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacing(of: spacing4),
          Text(
            cardItem.description,
            maxLines: 2,
            style: const TextStyle(
              color: textColor,
              fontSize: fontSize14,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
