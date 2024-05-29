import '../../app_exporter.dart';

/// This widget is used to resize the body of any widget passed to it to be
/// responsive so that it can fit on large screens without distorting the UI
class BodyWidth extends ConsumerWidget {
  /// [BodyWidth] constructor
  const BodyWidth({
    required this.body,
    super.key,
    this.maxWidth,
  });

  /// body widget
  final Widget body;

  /// max width
  final double? maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    final calcutResponsive = ref.watch(appResponsiveProvider(context));

    final isMobile = calcutResponsive.isMobileScreen;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? (isMobile ? width : width * 0.75),
        ),
        child: body,
      ),
    );
  }
}
