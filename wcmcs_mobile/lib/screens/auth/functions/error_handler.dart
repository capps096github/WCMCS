import '../../../app_exporter.dart';

///This function checks thru all errors and updates the error provider widget
void checkExceptionAndUpdate({
  required FirebaseAuthException firebaseAuthException,
  required WidgetRef ref,
  String? password,
  String? email,
}) {
  /// covert the above if-else to switch
  switch (firebaseAuthException.code) {
    case 'weak-password':
      ref.read(authErrorTextProvider.notifier).state =
          'Your Password ($password) is too weak.\nTry Again with a Stronger Password.';
    case 'email-already-in-use':
      ref.read(authErrorTextProvider.notifier).state =
          'Email ($email) is already in use.\nTry Again with a different Email.';
    case 'invalid-email':
      ref.read(authErrorTextProvider.notifier).state =
          'Invalid Email ($email) Try Again.';
    case 'operation-not-allowed':
      ref.read(authErrorTextProvider.notifier).state =
          'Email/Password Accounts are not enabled.\nTry Again Later.';
    case 'account-exists-with-different-credential':
      ref.read(authErrorTextProvider.notifier).state =
          'Your account already exists with a different credential.\nSign In Instead of using Google Sign In.';
    case 'user-not-found':
      ref.read(authErrorTextProvider.notifier).state =
          'No Account found for your Email ($email)\nSign Up Instead.';

    case 'wrong-password':
      ref.read(authErrorTextProvider.notifier).state =
          'Wrong password! ($password) Try Again.\nForgot Password?\nClick Forgot Password to reset it.';
    case 'user-disabled':
      ref.read(authErrorTextProvider.notifier).state =
          'Your Account has been disabled.\nContact Support.';
    case 'too-many-requests':
      ref.read(authErrorTextProvider.notifier).state =
          'Too many requests. Try again later.';
    case 'requires-recent-login':
      ref.read(authErrorTextProvider.notifier).state =
          'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';
    case 'invalid-credential':
      ref.read(authErrorTextProvider.notifier).state =
          'Invalid Credentials.\nTry Again.';
    case 'ERROR_MISSING_GOOGLE_AUTH_TOKEN':
      ref.read(authErrorTextProvider.notifier).state =
          'Missing Google Auth Token.\nTry Again.';
    default:
      ref.read(authErrorTextProvider.notifier).state =
          'Error Authenticating. Try Again.\nError Code: ${firebaseAuthException.code}';
  }
}
