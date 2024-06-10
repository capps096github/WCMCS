import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

import '../../app_exporter.dart';

/// this is the body of the tank screen
class TankBody extends StatelessWidget {
  /// [TankBody] constructor
  const TankBody({
    required this.tank,
    super.key,
  });

  /// the tank
  final Tank tank;

  @override
  Widget build(BuildContext context) {
    // get the height of the screen
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        const BoldTileWithDescription(
          boldTitle: BoldTitle(text: 'Water Level', color: appColor),
          description: 'The amount of water in your tank at the moment.',
        ),

        const Spacing(of: spacing32),

        //
        Expanded(
          child: SizedBox(
            height: screenHeight * .8,
            child: TankContainer(tank: tank),
          ),
        ),
      ],
    );
  }
}

/// has an animated tank
class TankContainer extends StatefulWidget {
  /// [TankContainer] constructor
  const TankContainer({required this.tank, super.key});

  /// tank
  final Tank tank;

  @override
  State<TankContainer> createState() => _TankContainerState();
}

class _TankContainerState extends State<TankContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      // duration: const Duration(milliseconds: 2500),
      duration: twoSeconds,
    );

    _animationController
      ..addListener(() => setState(() {}))
      ..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print
    printer(' Initial Volume: ${widget.tank.tankCapacity}');
    printer(' Amount Left Volume: ${widget.tank.currentTankVolume}');
    printer(' Tank Percentage: ${widget.tank.tankPercentage}');

    final percentage =
        _animationController.value * (widget.tank.tankPercentage);
    printer(' Percentage: $percentage');

    final isHalf = percentage > (_animationController.value / 2);

    printer(' Is Halft: $isHalf');
    printer(' Anim Value: ${_animationController.value}');

    final textColor = (isHalf ? appWhite : appColor);

    return LiquidLinearProgressIndicator(
      value: percentage,
      valueColor: const AlwaysStoppedAnimation(
        appColor,
      ),
      backgroundColor: appColor.withOpacity(.1),
      borderColor: appColor,
      borderWidth: 3,
      borderRadius: 12,
      direction: Axis.vertical,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoldTitle(
            text: numberFormatter.format(widget.tank.currentTankVolume),
            color: textColor,
          ),
          const Spacing(of: spacing4),
          BoldTitle(
            text: 'Litres Left',
            color: textColor,
            fontSize: 20,
          ),
          const Spacing(of: spacing4),
          Text(
            '* Capacity: ${numberFormatter.format(widget.tank.tankCapacity)}',
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
