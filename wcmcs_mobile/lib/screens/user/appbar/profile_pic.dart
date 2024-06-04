/// Package imports:
library;

import 'package:cached_network_image/cached_network_image.dart';

import '../../../app_exporter.dart';

/// displays the user profile pic
class ProfilePic extends ConsumerWidget {
  /// [ProfilePic] constructor
  const ProfilePic({
    required this.borderColor,
    super.key,
    this.radius = 65,
    this.margin = margin8,
  });

  /// redius
  final double radius;

  /// margin
  final EdgeInsetsGeometry? margin;

  /// border color
  final Color borderColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// app user
    final appUser = ref.watch(appUserProvider);

    /// profile pic
    final profilePic = appUser.profilePicUrl;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Spacing(of: spacing16),
        Center(
          child: Hero(
            tag: userProfileTag,
            child: Container(
              margin: margin,
              decoration: BoxDecoration(
                color: appBackground.withOpacity(.95),
                shape: BoxShape.circle,
                border: Border.all(
                  color: borderColor.withOpacity(.8),
                  width: 1.5,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: appBackground.withOpacity(.3),
                backgroundImage: CachedNetworkImageProvider(profilePic),
                radius: radius,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
