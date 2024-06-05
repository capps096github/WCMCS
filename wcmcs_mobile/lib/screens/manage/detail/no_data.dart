import '../../../app_exporter.dart';

/// this is shown when a given section has no data to display at the moment
class NoData extends StatelessWidget {
  /// [NoData] constructor
  const NoData({
    required this.section,
    required this.color,
    super.key,
  });

  /// section
  final Section section;

  /// color
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding16,
        child: BoldTileWithDescription(
          boldTitle: BoldTitle(
            text: 'No Water Data Available for your ${section.label}',
            color: color,
            fontSize: 30,
          ),
          description:
              'Check your pipe connection on the water tank and make sure that the pipe is connected to wifi through the water flow sensor.',
        ),
      ),
    );
  }
}
