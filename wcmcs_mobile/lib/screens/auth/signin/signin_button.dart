import '../../../app_exporter.dart';
import '../functions/exporter.dart';
import '../textfields/textfields_riverpod.dart';

/// this makes api calls to sign in the user
class SignInButton extends ConsumerStatefulWidget {
  /// [SignInButton] constructor
  const SignInButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInButtonState();
}

class _SignInButtonState extends ConsumerState<SignInButton> {
  /// isButtonTapped
  bool isButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    /// final isButtonTapped = ref.watch(_isButtonTappedProvider);
    final signInFormKey = ref.watch(signInFormKeyProvider);
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);

    return CircularProgressAppButton(
      isTapped: isButtonTapped,
      onTap: () async {
        /// Unfocus Keyboard
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        if (signInFormKey.currentState!.validate()) {
          setState(() {
            isButtonTapped = true;
          });

          await signInToCalcut(email: email, password: password, ref: ref).then(
            (value) {
              /// ignore: avoid_print
              /// print("User Signed In");
              if (mounted) {
                setState(() {
                  isButtonTapped = false;
                });
              }

              /// clear the form after sign in
              signInFormKey.currentState!.reset();

              /// Go to Home
              go(ref, to: homePath);
            },
          );
        }
      },
      text: 'LOG IN',
      icon: Icons.login,
      textColor: appWhite,
      buttonColor: appColor,
    );
  }
}
