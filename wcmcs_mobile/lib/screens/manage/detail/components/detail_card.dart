import '../../../../app_exporter.dart';

/// this displays the water flow chart
class DetailCard extends StatelessWidget {
  /// [DetailCard] constructor
  const DetailCard({
    required this.cardColor,
    required this.textColor,
    required this.value,
    required this.label,
    required this.description,
    super.key,
  });

  /// color
  final Color cardColor;

  /// color
  final Color textColor;

  /// value
  final double value;

  /// label
  final String label;

  /// description
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: cardColor.withOpacity(.05),
        borderRadius: borderRadius8,
        // thin border
        border: Border.all(
          color: cardColor,
          width: 2,
        ),
      ),
      // padding: padding8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: const BorderRadius.only(
                topLeft: circularRadius6,
                topRight: circularRadius6,
              ),
            ),
            child: Padding(
              padding: padding8,
              child: Column(
                children: [
                  const ThickHorizontalDivider(
                    dividerColor: appWhite,
                    margin: margin2,
                    dividerWidth: 50,
                  ),
                  const Spacing(of: spacing16),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: appWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacing(of: spacing8),
          // text
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                numberFormatter.format(value),
                // value.toStringAsFixed(2),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: textColor,
                ),
              ),
              const Spacing(of: spacing4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 10,
                  color: textColor.withOpacity(.7),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacing(of: spacing8),
            ],
          ),
        ],
      ),
    );
  }
}
