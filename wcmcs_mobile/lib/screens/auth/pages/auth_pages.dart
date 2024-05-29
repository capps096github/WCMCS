import '../../../app_exporter.dart';
import '../forgot/forgot_screen.dart';
import '../signin/signin_screen.dart';
import '../signup/signup_screen.dart';

/// Pages of the auth flow
List<Widget> authPages = [
  const SignInScreen(),
  const ForgotPasswordScreen(),
  const SignUpScreen(),

  /// const ResetPasswordScreen(),
];

///Indicies of the auth pages

/// sign in page index
const int signInPageIndex = 0;

/// forgot password page index
const int forgotPasswordPageIndex = 1;

/// sign up page index
const int signUpPageIndex = 2;
