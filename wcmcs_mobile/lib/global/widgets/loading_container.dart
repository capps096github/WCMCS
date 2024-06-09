import '../../app_exporter.dart';
import 'package:shimmer/shimmer.dart';

/// this is used for simulation of loading data
class LoadingContainer extends StatelessWidget {
  /// [LoadingContainer] constructor
  const LoadingContainer({
    super.key,
    this.height = spacing16,
    this.width = double.infinity,
    this.borderRadius,
    this.loadingColor = appColor,
    this.decoration,
    this.margin = EdgeInsets.zero,
  });

  /// height
  final double height;

  /// width
  final double width;

  /// border radius
  final BorderRadiusGeometry? borderRadius;

  /// loading color
  final Color loadingColor;

  /// decoration
  final Decoration? decoration;

  /// margin
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: loadingColor,
      highlightColor: appWhite,
      period: quarterSeconds,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: decoration ??
            BoxDecoration(
              color: loadingColor.withOpacity(.1),
              borderRadius: borderRadius ?? borderRadius8,
            ),
      ),
    );
  }
}

/// this is used for simulation of loading data in a sliver
class SliverLoadingContainer extends StatelessWidget {
  /// [SliverLoadingContainer] constructor
  const SliverLoadingContainer({
    super.key,
    this.height = spacing16,
    this.width = double.infinity,
    this.borderRadius,
    this.loadingColor = appColor,
    this.decoration,
  });

  /// height
  final double height;

  /// width
  final double width;

  /// border radius
  final BorderRadiusGeometry? borderRadius;

  /// loading color
  final Color loadingColor;

  /// decoration
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: LoadingContainer(
        height: height,
        width: width,
        borderRadius: borderRadius,
        loadingColor: loadingColor,
        decoration: decoration,
      ),
    );
  }
}
