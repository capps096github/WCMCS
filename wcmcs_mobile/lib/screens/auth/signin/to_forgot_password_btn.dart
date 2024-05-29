import '../../../app_exporter.dart';

/// Navigates to the forgot password page
class ForgotPasswordButton extends ConsumerWidget {
  /// [ForgotPasswordButton] constructor
  const ForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerRight,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: appTransparent,
        child: InkWell(
          onTap: () {
            final currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }

            ///  go to forgot password page index
            ref.read(authPageIndexProvider.notifier).state =
                forgotPasswordPageIndex;
          },
          customBorder: const RoundedRectangleBorder(
            borderRadius: borderRadius8,
          ),
          hoverColor: appColor.withOpacity(.05),
          splashColor: appColor.withOpacity(.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: spacing4,
              horizontal: spacing8,
            ),
            child: Text(
              'Forgot Password? (Reset it Here)',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: appColor.withOpacity(.8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
