import '../../../app_exporter.dart';
import '../pages/to_sign_in_button.dart';
import 'forgot_screen.dart';

/// shown when a password reset email is sent to the user
class EmailSent extends ConsumerWidget {
  /// [EmailSent] constructor
  const EmailSent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpandedScrollingColumn(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        const Icon(
          Icons.mail_outline,
          color: errorColor,
          size: 80,
        ),
        const Spacing(of: 50),
        const Padding(
          padding: padding8,
          child: Text(
            "We've sent you an email with a link to reset your password. Please check your inbox and follow the instructions.",
            textAlign: TextAlign.center,
            style: TextStyle(
              wordSpacing: 2,
              fontSize: 18,
            ),
          ),
        ),
        const Spacer(),
        const Text(
          'Try Again',
          style: TextStyle(
            color: errorColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacing(of: 20),
        AppButton(
          text: 'TRY AGAIN',
          icon: Icons.repeat,
          onTap: () {
            /// Is Email Sent
            ref.read(isResetEmailSentProvider.notifier).state = false;
          },
          textColor: appWhite,
          buttonColor: appColor,
        ),
        const Spacer(),
        const Spacing(of: 50),
        const ToSignInButton(question: 'Clicked this by mistake?'),
        const Spacing(of: 100),
      ],
    );
  }
}
