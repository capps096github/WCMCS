import '../../../app_exporter.dart';

/// has the user name and a greeting
class UserGreeting extends StatelessWidget {
  /// [UserGreeting] constructor
  const UserGreeting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // app user
        final appUser = ref.watch(appUserProvider);

        printer(appUser);

        return BoldTileWithDescription(
          boldTitle: BoldTitle(
            text: 'Hey ${appUser.firstName}',
            color: appColor,
            fontSize: 30,
          ),
          description: 'Welcome back to Water Warden',
        );
      },
    );
  }
}
