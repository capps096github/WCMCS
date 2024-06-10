import 'package:flutter/cupertino.dart';

import '../../app_exporter.dart';

/// used to add a new section when tapped
class TapToAddContents extends StatelessWidget {
  /// [TapToAddContents] constructor
  const TapToAddContents({
    super.key,
    this.label = 'Tap to Add a New Section',
  });

  /// label
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding16,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacing(of: spacing24),
          const Icon(
            CupertinoIcons.add_circled_solid,
            size: 120,
            color: appColor,
          ),
          Padding(
            padding: padding8,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: appColor,
                fontSize: fontSize14,
              ),
            ),
          ),
          const Spacing(of: spacing8),
        ],
      ),
    );
  }
}
