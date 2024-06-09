import '../../../../app_exporter.dart';
import '../../manage/data/water_db_refence.dart';
import 'about_item.dart';
import 'about_tile.dart';

import 'package:restart_app/restart_app.dart';

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
            // reset user provider and stream too
            ref
              ..invalidate(appUserProvider)
              ..invalidate(appUserStreamProvider)
              ..invalidate(sectionStreamProvider);

            /// wait for futures
            await Future.wait([
              if (authProvider != null && authProvider == 'google.com')
                GoogleSignIn().signOut(),

              // sign out of firebase
              FirebaseAuth.instance.signOut(),
            ]).then((_) {
              // Restart.restartApp(webOrigin: authPath);

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
