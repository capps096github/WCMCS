import '../../../app_exporter.dart';
import '../data/tank_type.dart';

/// this is the card that will be used to select the type of tank
class TankTypeCard extends ConsumerWidget {
  /// [TankTypeCard] constructor
  const TankTypeCard({
    required this.tankType,
    super.key,
  });

  /// tank type string
  final TankType tankType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // get the tank type
    final selectedTankType = ref.watch(selectedTankTypeProvider);

    // is the tank type selected
    final isSelected = selectedTankType.name == tankType.name;

    // card color
    final cardColor = isSelected ? appColor : appBlack.withOpacity(.2);

    // text color
    final textColor = isSelected ? appWhite : appBlack;

    return InkWell(
      onTap: () {
        ref.read(selectedTankTypeProvider.notifier).state = tankType;
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 150,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: borderRadius8,
          // thin border
          border: Border.all(
            color: cardColor,
          ),
        ),
        padding: padding8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacing(of: spacing8),
            // icon
            Icon(
              tankType.icon,
              color: textColor,
              size: 60,
            ),
            const Spacing(of: spacing8),

            Text(
              tankType.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
