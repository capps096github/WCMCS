import '../../../app_exporter.dart';
import '../pages/heading.dart';
import '../pages/to_sign_in_button.dart';
import '../textfields/forgot_email_field.dart';
import 'forgot_password_btn.dart';

/// This is the form that is used to reset the user's password
class ForgotForm extends ConsumerWidget {
  /// [ForgotForm] constructor
  const ForgotForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgotFormKey = ref.watch(forgotFormKeyProvider);

    const textColor = appColor;

    return SingleChildScrollView(
      child: AutofillGroup(
        key: const ValueKey('Forgot Password'),
        child: Form(
          key: forgotFormKey,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Heading(
                title: 'Forgot Password?',
                subtitle: 'Enter your email to reset your password',
              ),
              Spacing(of: 40),
              Text(
                "We'll send you an email with a link to reset your password.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  wordSpacing: 2,
                  color: textColor,

                  /// fontSize: 18,
                ),
              ),
              Spacing(of: 40),
              ForgotEmailField(fieldColor: textColor),
              Spacing(of: 25),
              ForgotPasswordSubmitButton(),
              Spacing(of: 50),
              ToSignInButton(question: 'Clicked this by mistake?'),
              Spacing(of: 50),

            ],
          ),
        ),
      ),
    );
  }
}
