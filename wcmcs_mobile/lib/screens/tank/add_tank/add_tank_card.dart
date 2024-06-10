import 'package:dotted_border/dotted_border.dart';

import '../../../app_exporter.dart';
import 'add_tank_screen.dart';

/// this is used to add a new section to the app
class AddTankCard extends StatelessWidget {
  /// [AddTankCard] constructor
  const AddTankCard({super.key});

  @override
  Widget build(BuildContext context) {
    return OpenRoute(
      to: const AddTankScreen(),
      closedShape: const RoundedRectangleBorder(
        borderRadius: borderRadius16,
      ),
      closedBuilder: (ctx, openSection) => DottedBorder(
        dashPattern: const [8, 4],
        radius: circularRadius8,
        borderType: BorderType.RRect,
        strokeWidth: 2.5,
        color: appColor,
        child: const TapToAddContents(label: 'Add Your Tank Details'),
      ),
    );
  }
}
