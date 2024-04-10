import '../../../wcmcs_exporter.dart';

/// This is the page to show on the home screen of the wcmcs app once the user selects from the nav bar
class HomePage {
  /// [HomePage] constructor
  HomePage({
    required this.label,
    required this.tooltip,
    required this.screenWidget,
    required this.routePath,
    this.selectedIcon,
    this.unselectedIcon,
    this.iconWidget,
  });

  /// name
  final String label;

  /// icon data
  final IconData? selectedIcon;

  /// unselected icon
  final IconData? unselectedIcon;

  /// icon widget this is used when the icon is not an icon data
  /// for example when the icon is an image
  /// make sure it also has a selected and unselected option too
  final Widget? iconWidget;

  /// widget
  final Widget screenWidget;

  /// naviagetion route path
  final String routePath;

  /// tooltip
  final String tooltip;
}
