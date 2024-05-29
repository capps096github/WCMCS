import 'package:flutter/cupertino.dart';

import '../../../app_exporter.dart';
import 'textfields_riverpod.dart';

/// Email Verification RegExp
final emailExp = RegExp(
  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
);

/// use to capture the email of the user from the forgot password form
class ForgotEmailField extends ConsumerWidget {
  /// [ForgotEmailField] constructor
  const ForgotEmailField({
    required this.fieldColor,
    super.key,
  });

  ///text field color
  final Color fieldColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      restorationId: 'forgot',
      onChanged: (email) {
        if (emailExp.hasMatch(email)) {
          ref.read(forgotEmailProvider.notifier).state = email;
        }

        /// print('Email: $email');
      },
      validator: (email) {
        if (email == null || email.isEmpty) {
          return ' Please Enter your Email ';
        }

        if (!emailExp.hasMatch(email)) {
          return ' Invalid Email Address ';
        }

        return null;
      },
      keyboardType: TextInputType.emailAddress,
      prefixIcon: CupertinoIcons.mail_solid,
      textInputAction: TextInputAction.done,
      hintText: 'Email Address',
      fillColor: fieldColor,
      textColor: fieldColor,
      autofillHints: const [AutofillHints.email, AutofillHints.username],
    );
  }
}
