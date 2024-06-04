import '../../../app_exporter.dart';

/// a class that holds the data for the about items
class AboutItem {
  /// [AboutItem] constructor
  AboutItem({
    required this.icon,
    required this.trailingIcon,
    required this.label,
    required this.tooltip,
    this.subtitle,
    this.onTap,
    this.textColor = appColor,
    this.tileColor = appWhite,
  });

  /// icon for this item
  final IconData icon;

  /// trailing icon for this item
  final IconData trailingIcon;

  /// label for this item
  final String label;

  /// tooltip for this item
  final String tooltip;

  /// subtitle for this item
  final String? subtitle;

  /// on tap for this item
  final VoidCallback? onTap;

  /// text color
  final Color textColor;

  /// tile color
  final Color tileColor;
}
