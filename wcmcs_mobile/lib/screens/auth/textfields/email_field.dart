import 'package:flutter/cupertino.dart';

import '../../../app_exporter.dart';
import 'textfields_riverpod.dart';

/// Email Verification RegExp
final emailExp = RegExp(
  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
);

/// use to capture the email of the user from the form
class EmailField extends ConsumerWidget {
  /// [EmailField] constructor
  const EmailField({
    required this.fieldColor,
    super.key,
  });

  /// [fieldColor] is the color of the field
  final Color fieldColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      restorationId: 'email',
      onChanged: (email) {
        if (emailExp.hasMatch(email)) {
          ref.read(emailProvider.notifier).state = email;
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
      prefixIcon: CupertinoIcons.mail,
      hintText: 'Email',
      fillColor: fieldColor,
      textColor: fieldColor,
      autofillHints: const [AutofillHints.email],
    );
  }
}
