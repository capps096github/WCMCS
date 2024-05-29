import '../../../app_exporter.dart';
import '../auth_error_text.dart';
import '../pages/heading.dart';
import 'signin_form.dart';

/// This is the sign in screen
class SignInScreen extends StatelessWidget {
  /// [SignInScreen] constructor
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Heading(
          title: 'Welcome Back to WCMCS',
          subtitle: 'Sign In to Continue',
        ),
        Spacing(of: spacing16),

        /// Error
        AuthErrorText(),

        SignInForm(),
      ],
    );
  }
}
