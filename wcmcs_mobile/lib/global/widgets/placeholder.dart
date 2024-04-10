import 'package:flutter/cupertino.dart';

import '../../wcmcs_exporter.dart';

class WcmcsPlaceholder extends StatelessWidget {
  ///This is a placeholder widget used to render blank sample screens in the app
  const WcmcsPlaceholder({super.key, required this.title});

  /// title text for the screen
  final String title;
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: wcmcsRandomColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              CupertinoIcons.circle_grid_hex_fill,
              color: wcmcsWhite,
              size: 80,
            ),
          ),

          const VerticalSpace(of: spacing16),

          // title
          Text(
            title + wcmcsRandomColor.toString(),
            style: const TextStyle(color: wcmcsWhite),
          ),
        ],
      ),
    );
  }
}
