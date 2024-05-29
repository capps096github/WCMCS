import '../../../app_exporter.dart';
import '../google_auth/google_auth_button.dart';
import '../pages/or_text.dart';
import '../textfields/exporter.dart';
import 'create_account_btn.dart';
import 'signin_button.dart';
import 'to_forgot_password_btn.dart';

/// This is the sign in form that is displayed to the user
class SignInForm extends ConsumerWidget {
  /// [SignInForm] constructor
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signinFormKey = ref.watch(signInFormKeyProvider);
    const textColor = appColor;

    return AutofillGroup(
      key: const ValueKey('Login'),
      child: Form(
        key: signinFormKey,
        child: const Column(
          children: [
            Spacing(of: spacing16),

            ///Email
            EmailField(fieldColor: textColor),
            Spacing(of: spacing16),

            ///Password
            PasswordField(fieldColor: textColor),
            Spacing(of: spacing8),

            ///Forgot Password Button
            ForgotPasswordButton(),
            Spacing(of: spacing16),

            ///Login
            SignInButton(),

            ///or
            ORText(),

            ///GOOGLE AUTH
            GoogleAuthButton(),
            Spacing(of: spacing24),

            ///bottom
            CreateAccountButton(),
            Spacing(of: spacing24 * 2),

            Spacing(of: spacing24),
            AppDisclaimer(),
          ],
        ),
      ),
    );
  }
}
