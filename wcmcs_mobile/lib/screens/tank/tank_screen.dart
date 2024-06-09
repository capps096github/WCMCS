import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

import '../../app_exporter.dart';

/// this shows the amount of water in the tanks
class TankScreen extends ConsumerWidget {
  /// [TankScreen ] constructor
  const TankScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // get the height of the screen
    final screenHeight = MediaQuery.of(context).size.height;

    //
    return Scaffold(
      appBar: AppBar(
        foregroundColor: appColor,
        scrolledUnderElevation: 0,
        title: const AppLogo(),
      ),
      body: SafeArea(
        child: Padding(
          padding: padding8,
          child: Column(
            children: [
              const BoldTileWithDescription(
                boldTitle: BoldTitle(text: 'Water Level', color: appColor),
                description: 'The amount of water in your tank at the moment.',
              ),

              const Spacing(of: spacing16),

              //
              Expanded(
                child: SizedBox(
                  height: screenHeight * .8,
                  child: LiquidLinearProgressIndicator(
                    // Defaults to 0.5.
                    value: .75,
                    valueColor: const AlwaysStoppedAnimation(
                      appColor,
                    ),
                    backgroundColor: appWhite,
                    borderColor: appColor,
                    borderWidth: 3,
                    borderRadius: 12,
                    direction: Axis.vertical,
                    center: const BoldTitle(text: '500 Litres'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
