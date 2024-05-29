import '../../../app_exporter.dart';

/// A button that navigates to the sign in page
class ToSignInButton extends ConsumerWidget {
  /// [ToSignInButton] constructor
  const ToSignInButton({
    required this.question,
    super.key,
  });

  /// question to ask the user e.g "Already have an account?"
  final String question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const textColor = appColor;

    return Material(
      borderRadius: BorderRadius.circular(8),
      color: appTransparent,
      child: InkWell(
        onTap: () {
          final currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }

          ///  go to sign in page index
          ref.read(authPageIndexProvider.notifier).state = signInPageIndex;
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hoverColor: appColor.withOpacity(.05),
        splashColor: appColor.withOpacity(.1),
        child: Ink(
          child: Padding(
            padding: padding8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  question,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const Spacing(of: 10),
                const Text(
                  'Sign In Instead',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: appColor),
                ),
                const ThickHorizontalDivider(
                  thickness: 4,
                  dividerWidth: 100,
                  margin: EdgeInsets.symmetric(vertical: 5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
