import 'package:flutter/cupertino.dart';
import '../../../app_exporter.dart';

import '../functions/forgot_password.dart';
import '../textfields/textfields_riverpod.dart';
import 'forgot_screen.dart';

final _isButtonTappedProvider = StateProvider((ref) => false);

/// This is the button that is used to submit the email for the user to reset the password
class ForgotPasswordSubmitButton extends ConsumerWidget {
  /// [ForgotPasswordSubmitButton] constructor
  const ForgotPasswordSubmitButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isButtonTapped = ref.watch(_isButtonTappedProvider);

    final forgotFormKey = ref.watch(forgotFormKeyProvider);
    final email = ref.watch(forgotEmailProvider);

    return CircularProgressAppButton(
      text: 'SEND MAIL',
      isTapped: isButtonTapped,
      onTap: () async {
        /// Unfocus Keyboard
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        if (forgotFormKey.currentState!.validate()) {
          ref.read(_isButtonTappedProvider.notifier).state = true;

          await forgotCalcutPassword(email: email).then(
            (value) {
              /// ignore: avoid_print
              print('Email Sent');
              ref.read(_isButtonTappedProvider.notifier).state = false;

              /// Is Email Sent
              ref.read(isResetEmailSentProvider.notifier).state = true;
            },
          );
        }
      },
      textColor: appWhite,
      buttonColor: errorColor,
      icon: CupertinoIcons.mail_solid,
    );
  }
}
