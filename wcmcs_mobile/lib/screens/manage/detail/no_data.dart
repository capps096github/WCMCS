import '../../../app_exporter.dart';

/// this is shown when a given section has no data to display at the moment
class NoData extends StatelessWidget {
  /// [NoData] constructor
  const NoData({
    required this.label,
    required this.color,
    super.key,
  });

  /// section
  final String label;

  /// color
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppLogo(
            logoSize: 80,
            logoColor: color,
          ),
          const Spacing(of: spacing16),
          Center(
            child: Padding(
              padding: padding16,
              child: BoldTileWithDescription(
                boldTitle: BoldTitle(
                  text: label,
                  color: color,
                  fontSize: 25,
                ),
                description:
                    'Check your pipe connection on the water tank and make sure that the pipe is connected to wifi through the water flow sensor.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
