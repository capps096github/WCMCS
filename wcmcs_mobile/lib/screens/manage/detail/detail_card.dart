import '../../../app_exporter.dart';

/// this displays the water flow chart
class DetailCard extends StatelessWidget {
  /// [DetailCard] constructor
  const DetailCard({
    required this.cardColor,
    required this.textColor,
    required this.value,
    required this.label,
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
      padding: padding8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacing(of: spacing8),
          // text
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                numberFormatter.format(value),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: textColor,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: textColor.withOpacity(.7),
                  fontWeight: FontWeight.bold,
                ),
              ),
              ThickHorizontalDivider(
                dividerColor: textColor,
                margin: margin8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
