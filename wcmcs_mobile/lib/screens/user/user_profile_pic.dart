import 'package:cached_network_image/cached_network_image.dart';

import '../../../app_exporter.dart';

/// this is the user profile pic to show in the app bar
class UserProfilePic extends ConsumerWidget {
  /// Constructor for the [UserProfilePic]
  const UserProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// current app user
    final appUser = ref.watch(appUserProvider);

    /// user profile color
    /// start color
    const startColor = appGreen;

    /// end color
    const endColor = appGreen;

    const backgroundColor = startColor;

    return InkWell(
      onTap: () {
        /// Navigate to user details screen
        push(ref, to: userProfilePath);
      },
      customBorder: const CircleBorder(),
      child: Ink(
        child: Stack(
          children: [
            Hero(
              tag: userProfileTag,
              child: Container(
                margin: margin8,
                decoration: BoxDecoration(
                  color: backgroundColor.withOpacity(.3),
                  border: Border.all(
                    color: endColor.withOpacity(.8),
                    width: 1.5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundColor: appBackground.withOpacity(.3),
                  backgroundImage:
                      CachedNetworkImageProvider(appUser.profilePicUrl),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 8,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: endColor,
                  border: Border.all(
                    color: appWhite,
                    width: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
