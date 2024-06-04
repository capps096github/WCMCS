import '../../../app_exporter.dart';

/// shows the user's name and email
class ProfileNameEmail extends ConsumerWidget {
  /// [ProfileNameEmail] constructor
  const ProfileNameEmail({
    required this.textColor,
    required this.startColor,
    super.key,
  });

  /// text color
  final Color textColor;

  /// start color
  final Color startColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// app user
    final appUser = ref.watch(appUserProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// name get the first name by splitting the name
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              end: Alignment.topLeft,
              begin: Alignment.bottomRight,
              colors: [
                textColor,
                startColor,
              ],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: Text(
            appUser.firstName,
            style: const TextStyle(
              fontSize: 48,
              color: appWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        /// email
        Text(
          appUser.email,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: textColor.withOpacity(.6),
          ),
        ),
      ],
    );
  }
}
