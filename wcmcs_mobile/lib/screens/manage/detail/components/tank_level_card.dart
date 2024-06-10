import '../../../../app_exporter.dart';

/// shows the litres of a section
class TankLevelCard extends ConsumerWidget {
  /// [TankLevelCard] constructor
  const TankLevelCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // tile color
    const tileColor = appBlack;

    // text color
    const textColor = appWhite;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: tileColor,
        borderRadius: borderRadius8,
      ),
      padding: padding16,
      child: InkWell(
        onTap: () => push(ref, to: tankPath),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppLogo(logoColor: textColor, logoSize: 30),
            Spacing(of: spacing8),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tank Water Level',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: textColor,
                    ),
                  ),
                  Spacing(of: spacing2),
                  Text(
                    'Check out how much water you have in your tank at the moment.',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Spacing(of: spacing8),
            Icon(
              Icons.arrow_forward_rounded,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
