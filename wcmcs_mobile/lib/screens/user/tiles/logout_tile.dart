import '../../../../app_exporter.dart';
import 'about_item.dart';
import 'about_tile.dart';

/// This is the logout tile that logs out the user from the app
class LogoutTile extends ConsumerWidget {
  /// [LogoutTile] constructor
  const LogoutTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// current app user
    final appUser = FirebaseAuth.instance.currentUser;

    /// auth prvider
    final authProvider = appUser?.providerData[0].displayName;

    //
    return Padding(
      padding: horizontalPadding16,
      child: AboutTile(
        aboutItem: AboutItem(
          icon: Icons.logout,
          trailingIcon: Icons.power,
          label: 'LOG OUT',
          tileColor: errorColor,
          textColor: appWhite,
          onTap: () async {
            /// wait for futures
            await Future.wait([
              if (authProvider != null && authProvider == 'google.com')
                GoogleSignIn().signOut(),
              FirebaseAuth.instance.signOut(),
            ]).then((_) {
              /// check go to home
              go(ref, to: authPath);
            });
          },
          tooltip: 'LOG OUT',
        ),
      ),
    );
  }
}
