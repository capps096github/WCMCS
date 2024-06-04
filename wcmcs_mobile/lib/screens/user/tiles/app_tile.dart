import 'package:cached_network_image/cached_network_image.dart';

import '../../../app_exporter.dart';

/// A custom tile for the calcut app
class AppTile extends StatelessWidget {
  /// [AppTile] constructor
  const AppTile({
    required this.textColor,
    required this.tileColor,
    required this.tooltip,
    required this.onTap,
    required this.icon,
    required this.label,
    required this.subtitle,
    this.trailingIcon,
    super.key,
    this.userProfileUrl,
  });

  /// user profile url
  final String? userProfileUrl;

  /// text color
  final Color textColor;

  /// tile color
  final Color tileColor;

  /// tooltip
  final String tooltip;

  /// on tap
  final VoidCallback? onTap;

  /// icon
  final IconData icon;

  /// trailing icon for this tile
  final IconData? trailingIcon;

  /// label
  final String label;

  /// subtitle/
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Tooltip(
        message: tooltip,
        textStyle: TextStyle(color: tileColor),
        decoration: BoxDecoration(
          color: textColor,
          borderRadius: borderRadius4,
        ),
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
              borderRadius: BorderRadius.circular(8),
            ),
            onTap: onTap,
            dense: true,
            leading: (userProfileUrl != null)
                ? CircleAvatar(
                    backgroundColor: appBackground.withOpacity(.3),
                    backgroundImage:
                        CachedNetworkImageProvider(userProfileUrl!),
                  )
                : Icon(
                    icon,
                    color: textColor,
                  ),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: spacing4),
              child: Text(
                label,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: (subtitle != null)
                ? Text(
                    subtitle!,
                    maxLines: 4,
                    style: TextStyle(
                      fontSize: 12,
                      color: textColor,
                    ),
                  )
                : null,
            trailing: (trailingIcon != null)
                ? Icon(
                    trailingIcon,
                    color: textColor,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
