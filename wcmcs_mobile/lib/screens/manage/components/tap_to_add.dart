import 'package:flutter/cupertino.dart';

import '../../../app_exporter.dart';

/// used to add a new section when tapped
class TapToAddSection extends StatelessWidget {
  /// [TapToAddSection] constructor
  const TapToAddSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding16,
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacing(of: spacing24),
          Icon(
            CupertinoIcons.add_circled_solid,
            size: 120,
            color: appColor,
          ),
          Padding(
            padding: padding8,
            child: Text(
              'Tap to Add a New Section',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appColor,
                fontSize: fontSize14,
              ),
            ),
          ),
          Spacing(of: spacing8),
        ],
      ),
    );
  }
}
