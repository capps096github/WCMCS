import '../../app_exporter.dart';

/// Responsive builder
class AppResponsiveBuilder extends ConsumerWidget {
  /// [AppResponsiveBuilder] constructor
  const AppResponsiveBuilder({
    required this.mobile,
    required this.desktop,
    this.tablet,
    super.key,
  });

  /// widget to be displayed on mobile
  final Widget mobile;

  /// widget to be displayed on tablet
  final Widget? tablet;

  /// widget to be displayed on desktop
  final Widget desktop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // responsiveness
    final wcmcsResponsive = ref.watch(appResponsiveProvider(context));

    final isDesktop = wcmcsResponsive.isDesktopScreen;
    final isTablet = wcmcsResponsive.isTabletScreen;

    if (isDesktop) {
      return desktop;
    }
    // If width it less then 1024 and more then 600 we consider it as tablet
    else if (isTablet) {
      return tablet ?? desktop;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
