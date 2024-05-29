import '../../../app_exporter.dart';

import 'email_sent.dart';
import 'forgot_form.dart';

/// [isResetEmailSentProvider] to check if the reset email is sent
final isResetEmailSentProvider = StateProvider((ref) => false);

/// This is the screen that is used to reset the user's password
/// it shows the form to reset the password and the email sent screen
class ForgotPasswordScreen extends ConsumerWidget {
  /// [ForgotPasswordScreen] constructor
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResetEmailSent = ref.watch(isResetEmailSentProvider);

    return AnimatedSwitcher(
      duration: halfSeconds,
      child: isResetEmailSent ? const EmailSent() : const ForgotForm(),
    );
  }
}
