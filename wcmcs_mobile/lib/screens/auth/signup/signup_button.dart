import '../../../app_exporter.dart';
import '../functions/exporter.dart';
import '../textfields/textfields_riverpod.dart';

/// this makes api calls to sign in the user
class SignUpButton extends ConsumerStatefulWidget {
  /// [SignUpButton] constructor
  const SignUpButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends ConsumerState<SignUpButton> {
  /// isButtonTapped
  bool isButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    final signUpFormKey = ref.watch(signUpFormKeyProvider);

    /// Credentials
    final email = ref.watch(emailProvider);
    final name = ref.watch(nameProvider);
    final password = ref.watch(passwordProvider);

    return CircularProgressAppButton(
      isTapped: isButtonTapped,
      text: 'SIGN UP',
      onTap: () async {
        // reset error
        ref.read(authErrorTextProvider.notifier).state = '';
        
        /// Unfocus Keyboard
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        if (signUpFormKey.currentState!.validate()) {
          setState(() {
            isButtonTapped = true;
          });

          //? wait for futures ...
          await Future.wait([
            /// * Sign Up
            signUpForApp(
              email: email,
              password: password,
              name: name,
              ref: ref,
            ),
          ]).then(
            (value) async {
              /// ignore: avoid_print
              print('User Signed Up - Created');
              if (mounted) {
                setState(() {
                  isButtonTapped = false;
                });
              }

              /// clear the form after sign in
              signUpFormKey.currentState!.reset();

              /// Go to Home
              go(ref, to: homePath);
            },
          );
        }
      },
      icon: Icons.connect_without_contact_rounded,
      textColor: appWhite,
      buttonColor: appColor,
    );
  }
}
