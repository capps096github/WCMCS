import '../../../app_exporter.dart';

/// THis is shown when the section has no data to display that day
class EmptySection extends StatelessWidget {
  /// [EmptySection] constructor
  const EmptySection({
    required this.color,
    this.label,
    this.showTitle = true,
    super.key,
  });

  /// color
  final Color color;

  /// label
  final String? label;

  /// show title
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding16,
      children: [
        if (showTitle && label != null)
          BoldTileWithDescription(
            boldTitle: BoldTitle(
              text: label ?? 'No Data Available',
              color: color,
              fontSize: 25,
            ),
            description:
                'Check your pipe connection on the water tank and make sure that the pipe is connected to wifi through the water flow sensor.',
          ),
        const Spacing(of: spacing16),
        LoadingContainer(height: 80, loadingColor: color),
        const Spacing(of: spacing8),
        LoadingContainer(height: 30, width: 100, loadingColor: color),
        const Spacing(of: spacing16),
        //  litres and price cards in a row
        Row(
          children: [
            // litres card
            Expanded(
              child: LoadingContainer(height: 200, loadingColor: color),
            ),
            const Spacing(of: spacing16),
            // price card
            Expanded(
              child: LoadingContainer(height: 200, loadingColor: color),
            ),
          ],
        ),

        // spacing
        const Spacing(of: spacing16),

        // *
        LoadingContainer(height: 30, width: 100, loadingColor: color),
        const Spacing(of: spacing16),

        // section chart
        LoadingContainer(height: 350, loadingColor: color),
        const Spacing(of: spacing16),

        // list
        ...List.generate(
          5,
          (index) => LoadingContainer(
            height: 100,
            loadingColor: color,
            margin: marginV4,
          ),
        ),
      ],
    );
  }
}
