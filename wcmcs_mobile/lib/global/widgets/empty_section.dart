import '../../app_exporter.dart';
import '../../screens/manage/detail/no_data.dart';

/// THis is shown when the section has no data to display that day
class EmptySection extends StatelessWidget {
  /// [EmptySection] constructor
  const EmptySection({
    required this.color,
    this.label,
    this.showTitle = true,
    this.hasColumn = false,
    super.key,
  });

  /// color
  final Color color;

  /// label
  final String? label;

  /// show title
  final bool showTitle;

  /// has column
  final bool hasColumn;

  @override
  Widget build(BuildContext context) {
    final children = [
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
    ];
    return AnimatedSwitcher(
      duration: halfSeconds,
      child: (showTitle && label != null)
          ? NoData(label: label ?? 'No Data Available', color: color)
          : ShimmerAnimation(
              color: color,
              child: Padding(
                padding: padding16,
                child: hasColumn
                    ? Column(children: children)
                    : ListView(children: children),
              ),
            ),
    );
  }
}
