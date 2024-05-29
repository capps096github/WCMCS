import '../../../app_exporter.dart';

import 'error_handler.dart';

/// This function is used to sign up to Calcut with email and password
Future<void> signUpForApp({
  required String email,
  required String password,
  required String name,
  required WidgetRef ref,
}) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
      (userCredential) async {
        final user = userCredential.user;
        if (user != null) {
          final calcutUser = AppUser(
            displayName: user.displayName ?? '-',
            email: user.email ?? '-',
            profilePicUrl: user.photoURL ?? defaultProfilePic,
            userId: user.uid,
            joinedOn: Timestamp.now(),
          );

          /// wait for futures
          await Future.wait([
            /// update name
            user.updateDisplayName(name),

            ///  verify email
            if (!user.emailVerified) user.sendEmailVerification(),

            /// reload the user
            user.reload(),

            /// upload user to database
            AppUsersDBService.uploadCalcutUser(appUser: calcutUser),
          ]);
        }
      },
    );
  } on FirebaseAuthException catch (e) {
    checkExceptionAndUpdate(
      firebaseAuthException: e,
      ref: ref,
      password: password,
      email: email,
    );
  } catch (e) {
    /// update authErrorTextProvider
    ref.read(authErrorTextProvider.notifier).state =
        'Error Signing Up. Try Again.\nError Code: $e';

    /// go to auth page
  }
}
