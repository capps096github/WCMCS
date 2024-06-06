import 'package:flutter/cupertino.dart';

import '../../../app_exporter.dart';
import '../models/water_flow.dart';

/// this displays the water flow chart
class WaterFlowData extends StatelessWidget {
  /// [WaterFlowData] constructor
  const WaterFlowData({
    required this.color,
    required this.waterFlows,
    super.key,
  });

  /// waterFlows
  final List<WaterFlow> waterFlows;

  /// color
  final Color color;

  @override
  Widget build(BuildContext context) {
    // tile color
    final tileColor = color.withOpacity(.05);

    // text color
    final textColor = color;

    // this will render the chart data
    return Column(
      children: [
        ...List.generate(
          waterFlows.length,
          (index) {
            // water flow
            final waterFlow = waterFlows[index];

            return Padding(
              padding: verticalPadding4,
              child: Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: borderRadius8,
                color: tileColor,
                child: ListTile(
                  tileColor: tileColor,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: textColor.withOpacity(.8),
                    ),
                    borderRadius: borderRadius8,
                  ),
                  dense: true,
                  title: Text(
                    'Uploaded at: ${waterFlow.time}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  subtitle: Text(
                    'Water Value: ${waterFlow.value} litres',
                    style: const TextStyle(
                      color: appNavy,
                    ),
                  ),
                  leading: Icon(CupertinoIcons.drop_fill, color: color),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
