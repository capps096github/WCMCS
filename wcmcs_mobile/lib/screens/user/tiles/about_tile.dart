import '../../../../app_exporter.dart';
import 'about_item.dart';
import 'app_tile.dart';

/// this is the tile shown in the about screen when viewing the user profile
class AboutTile extends StatelessWidget {
  /// [AboutTile] constructor
  const AboutTile({
    required this.aboutItem,
    super.key,
  });

  ///item from which params will be got
  final AboutItem aboutItem;
  @override
  Widget build(BuildContext context) {
    return AppTile(
      textColor: aboutItem.textColor,
      tileColor: aboutItem.tileColor,
      tooltip: aboutItem.tooltip,
      onTap: aboutItem.onTap,
      icon: aboutItem.icon,
      trailingIcon: aboutItem.trailingIcon,
      label: aboutItem.label,
      subtitle: aboutItem.subtitle,
    );
  }
}
