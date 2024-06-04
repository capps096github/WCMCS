import '../../../app_exporter.dart';
import '../appbar/profile_header.dart';
import '../tiles/logout_tile.dart';

/// shows the user profile
class UserProfileBody extends ConsumerWidget {
  ///[UserProfileBody] constructor
  const UserProfileBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ExpandedScrollingColumn(
      children: [
        // profile header
        ProfileHeader(),

        // logout
        LogoutTile(),

        Spacer(),

        AppLogo(
          logoSize: 100,
        ),

        Spacing(of: spacing24),
      ],
    );
  }
}
