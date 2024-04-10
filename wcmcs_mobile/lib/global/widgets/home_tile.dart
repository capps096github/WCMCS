import '../../wcmcs_exporter.dart';

/// this is displayed on the home screen to perform some actions
class HomeTile extends StatelessWidget {
  /// [HomeTile] constructor
  const HomeTile({
    required this.title,
    this.subtitle,
    this.icon,
    super.key,
    this.onTap,
    this.textColor = wcmcsWhite,
    this.tileColor = wcmcsColor,
    this.iconWidget,
  });

  /// title
  final String title;

  /// subtitle
  final String? subtitle;

  /// on tap
  final VoidCallback? onTap;

  /// icon
  final IconData? icon;

  /// icon widget
  final Widget? iconWidget;

  /// tile color
  final Color tileColor;

  /// text color
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: verticalPadding4,
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: borderRadius8,
        color: tileColor,
        child: ListTile(
          tileColor: tileColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: textColor.withOpacity(.2)),
            borderRadius: borderRadius8,
          ),
          onTap: onTap,
          dense: true,
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          subtitle: (subtitle != null)
              ? Text(
                  subtitle!,
                  style: TextStyle(
                    color: textColor,
                  ),
                )
              : null,
          trailing: iconWidget ?? Icon(icon, color: textColor),
        ),
      ),
    );
  }
}
