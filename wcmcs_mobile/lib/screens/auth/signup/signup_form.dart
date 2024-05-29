import '../../../app_exporter.dart';
import '../gender/gender_selector.dart';
import '../google_auth/google_auth_button.dart';
import '../pages/or_text.dart';
import '../pages/to_sign_in_button.dart';
import '../textfields/email_field.dart';
import '../textfields/name_field.dart';
import '../textfields/password_field.dart';
import 'signup_button.dart';

/// this is the sign up form that is displayed to the user
class SignUpForm extends ConsumerWidget {
  /// [SignUpForm] constructor
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpFormKey = ref.watch(signUpFormKeyProvider);

    const backColor = appColor;
    const textColor = appWhite;

    return AutofillGroup(
      key: const ValueKey('SignUp'),
      child: Form(
        key: signUpFormKey,
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NameField(fieldColor: backColor),
            Spacing(of: spacing16),

            ///Gender
            GenderSelector(
              backgroundColor: backColor,
              textColor: textColor,
              isPartOfRegister: true,
            ),
            Spacing(of: spacing16),

            ///Email
            EmailField(fieldColor: backColor),
            Spacing(of: spacing16),

            ///Password
            PasswordField(isSignUpScreen: true, fieldColor: backColor),
            Spacing(of: spacing16),

            ///Sign Up
            SignUpButton(),

            ///or
            ORText(),

            ///GOOGLE AUTH

            GoogleAuthButton(text: 'SIGN UP'),
            Spacing(of: spacing24),

            ///
            ToSignInButton(question: 'Already Have an Account?'),
            Spacing(of: spacing24 * 2),

            Spacing(of: spacing24),
            AppDisclaimer(),
          ],
        ),
      ),
    );
  }
}
