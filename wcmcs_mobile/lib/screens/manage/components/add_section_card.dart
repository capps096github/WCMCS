import 'package:dotted_border/dotted_border.dart';

import '../../../app_exporter.dart';
import '../add_section/add_section_screen.dart';
import 'tap_to_add.dart';

/// this is used to add a new section to the app
class AddSectionCard extends StatelessWidget {
  /// [AddSectionCard] constructor
  const AddSectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return OpenRoute(
      to: const AddSectionScreen(),
      closedShape: const RoundedRectangleBorder(
        borderRadius: borderRadius16,
      ),
      closedBuilder: (ctx, openSection) => DottedBorder(
        dashPattern: const [8, 4],
        radius: circularRadius8,
        borderType: BorderType.RRect,
        strokeWidth: 2.5,
        color: appColor,
        child: Material(
          color: appWhite.withOpacity(.6),
          shape: const RoundedRectangleBorder(borderRadius: borderRadius8),
          clipBehavior: Clip.antiAlias,
          child: const TapToAddSection(),
        ),
      ),
    );
  }
}
