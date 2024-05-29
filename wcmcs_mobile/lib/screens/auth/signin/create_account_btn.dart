import '../../../app_exporter.dart';

/// biutton that navigates to the create account page
class CreateAccountButton extends ConsumerWidget {
  /// [CreateAccountButton] constructor
  const CreateAccountButton({
    super.key,
  });

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

          ///  go to create page index
          ref.read(authPageIndexProvider.notifier).state = signUpPageIndex;
        },
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        hoverColor: appColor.withOpacity(.05),
        splashColor: appColor.withOpacity(.1),
        child: Ink(
          child: const Padding(
            padding: padding8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Don't Have an Account yet?",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                Spacing(of: 10),
                Text(
                  'Create New Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: appColor),
                ),
                ThickHorizontalDivider(
                  thickness: 4,
                  dividerWidth: 150,
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
