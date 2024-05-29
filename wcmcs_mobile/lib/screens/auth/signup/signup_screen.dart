import '../../../app_exporter.dart';
import '../auth_error_text.dart';
import '../pages/heading.dart';
import 'signup_form.dart';

/// This is the sign up screen
class SignUpScreen extends StatelessWidget {
  /// [SignUpScreen] constructor
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExpandedScrollingColumn(
      children: [
        Heading(
          title: 'Welcome to WCMS',
          fontSize: 36,
          subtitle: 'Sign Up to Get Started',
        ),
        Spacing(of: spacing24),

        /// Error
        AuthErrorText(),

        SignUpForm(),
      ],
    );
  }
}
