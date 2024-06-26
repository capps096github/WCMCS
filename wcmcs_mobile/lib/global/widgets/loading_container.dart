import 'package:shimmer/shimmer.dart';

import '../../app_exporter.dart';

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
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: decoration ??
          BoxDecoration(
            color: loadingColor.withOpacity(.1),
            borderRadius: borderRadius ?? borderRadius8,
          ),
    );
  }
}

/// shimmers any child widget it has
class ShimmerAnimation extends StatelessWidget {
  /// [ShimmerAnimation] constructor
  const ShimmerAnimation({required this.color, required this.child, super.key});

  /// color
  final Color color;

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: color,
      highlightColor: appWhite,
      period: quarterSeconds,
      child: child,
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
