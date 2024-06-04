import '../../../app_exporter.dart';
import 'profile_clipper.dart';
import 'profile_name_email.dart';
import 'profile_pic.dart';

/// this is the header for the user profile
class ProfileHeader extends ConsumerWidget {
  /// Constructor for the [ProfileHeader]
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// user profile color
    /// start color
    const startColor = appColor;

    /// end color
    final endColor = appColor.withOpacity(.7);

    //
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: appWhite,
        borderRadius: borderRadius8,
        border: Border.all(
          color: startColor.withOpacity(.8),
        ),
      ),
      margin: margin16,
      child: Column(
        children: [
          //
          Stack(
            children: [
              ClipPath(
                clipper: ProfileClipper(),
                child: Container(
                  decoration: BoxDecoration(
                    color: appColor,
                    borderRadius: borderRadius6,

                    /// linear gradient
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        startColor,
                        startColor.withOpacity(.8),
                      ],
                    ),
                  ),
                  height: profileClipperHeight,
                ),
              ),

              /// profile pic
              const ProfilePic(borderColor: startColor),
            ],
          ),

          ProfileNameEmail(textColor: startColor, startColor: endColor),
          const Spacing(of: spacing16),
        ],
      ),
    );
  }
}
