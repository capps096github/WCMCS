import 'package:flutter/cupertino.dart';

import '../../../app_exporter.dart';
import 'textfields_riverpod.dart';

/// use to capture the password of the user from the form
class PasswordField extends ConsumerStatefulWidget {
  /// [PasswordField] constructor
  const PasswordField({
    required this.fieldColor,
    super.key,
    this.isSignUpScreen = false,
  });

  /// check whether we are on Sign In Screen
  final bool isSignUpScreen;

  ///text field color
  final Color fieldColor;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends ConsumerState<PasswordField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      restorationId:
          widget.isSignUpScreen ? 'password_signup' : 'password_signin',
      onChanged: (password) {
        ref.read(passwordProvider.notifier).state = password;
      },
      validator: (password) {
        if (password == null || password.isEmpty || password.length < 6) {
          return ' A Strong Password upto 6 Characters is required. ';
        }

        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      prefixIcon:
          isObscured ? CupertinoIcons.lock_fill : CupertinoIcons.lock_open_fill,
      hintText: 'Password',
      suffixIcon: IconButton(
        icon: Icon(
          isObscured ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
          color: widget.fieldColor,
        ),
        onPressed: () {
          setState(() {
            isObscured ? isObscured = false : isObscured = true;
          });
        },
      ),
      autofillHints: const [AutofillHints.password],
      obscureText: isObscured,
      fillColor: widget.fieldColor,
      textColor: widget.fieldColor,
      textInputAction: TextInputAction.done,
    );
  }
}
