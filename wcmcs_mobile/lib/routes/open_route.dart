import '../app_exporter.dart';

///An animation wrapper around [OpenContainer]
class OpenRoute extends StatelessWidget {
  ///An animation wrapper around [OpenContainer]
  const OpenRoute({
    required this.to,
    required this.closedBuilder,
    this.routePath,
    super.key,
    this.openColor = appColor,
    this.closedColor = appTransparent,
    this.closedBorderRadius,
    this.closedShape,
  });

  /// path to go to
  final String? routePath;

  /// Background color of the [OpenContainer] while it is open.
  final Color openColor;

  /// Background color of the [OpenContainer] while it is closed.
  final Color closedColor;

  ///The Widget we are navigating to
  final Widget to;

  /// border radius for the closed container
  final BorderRadius? closedBorderRadius;

  /// shape of the [OpenContainer] when closed
  final ShapeBorder? closedShape;

  /// builder of the widget to be wrapped around
  final CloseContainerBuilder closedBuilder;

  @override
  Widget build(BuildContext context) {
    // check if child is confirm payment page
    // so that we don't show internet checker
    // coz it distrubs keyboard input

  
    return OpenContainer(
      openBuilder: (context, _) => to,
      openColor: openColor,
      // useRootNavigator: true,
      //* closed
      closedColor: closedColor,
      closedElevation: 0,
      closedShape: closedShape ??
          RoundedRectangleBorder(
            borderRadius: closedBorderRadius ?? borderRadius8,
          ),
      closedBuilder: closedBuilder,
      routeSettings: RouteSettings(name: routePath),
    );
  }
}
