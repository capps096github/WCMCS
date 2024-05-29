import 'package:flutter/cupertino.dart';

import '../../app_exporter.dart';

/// a place holder widget to render blank sample screens in the app
class AppPlaceholder extends StatelessWidget {
  ///This is a placeholder widget used to render blank sample screens in the app
  const AppPlaceholder({required this.title, super.key});

  /// title text for the screen
  final String title;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: wcmcsRandomColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              CupertinoIcons.circle_grid_hex_fill,
              color: appWhite,
              size: 80,
            ),
          ),

          const Spacing(of: spacing16),

          // title
          Text(
            title + wcmcsRandomColor.toString(),
            style: const TextStyle(color: appWhite),
          ),
        ],
      ),
    );
  }
}
