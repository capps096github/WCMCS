import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../app_exporter.dart';
import 'tap_to_add.dart';

/// this is used to add a new section to the app
class AddSectionCard extends StatelessWidget {
  /// [AddSectionCard] constructor
  const AddSectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: const [8, 4],
      radius: const Radius.circular(8),
      borderType: BorderType.RRect,
      color: appColor,
      child: Material(
        color: appWhite.withOpacity(.6),
        shape: const RoundedRectangleBorder(borderRadius: borderRadius8),
        clipBehavior: Clip.antiAlias,
        child: const TapToAddSection(),
      ),
    );
  }
}
