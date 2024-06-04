import '../../app_exporter.dart';
import 'body/user_profile_body.dart';

/// this is a widget showing the user profile details and logout button

class UserProfile extends ConsumerWidget {
  /// [UserProfile] constructor
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// user profile color
    /// start color
    const startColor = appColor;

    /// end color
    const endColor = appNavy;

    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        /// go to home
        leading: const AppBackButton(path: homePath),
        title: const Text('Profile'),
        backgroundColor: startColor,
      ),
      body: ColoredBox(
        color: endColor.withOpacity(.1),
        child: const BodyWidth(
          body: UserProfileBody(),
        ),
      ),
    );
  }
}
