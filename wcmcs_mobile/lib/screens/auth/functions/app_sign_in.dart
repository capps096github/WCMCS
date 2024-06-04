import '../../../app_exporter.dart';
import 'error_handler.dart';

/// This function is used to sign in to Calcut with email and password
Future<void> signInToApp({
  required String email,
  required String password,
  required WidgetRef ref,
}) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((UserCredential userCredential) async {
      final user = userCredential.user;
      if (user != null) {
        final calcutUser = AppUser(
          displayName: user.displayName ?? '-',
          email: user.email ?? '-',
          profilePicUrl: user.photoURL ?? defaultProfilePic,
          userId: user.uid,
          joinedOn: Timestamp.now(),
        );

        /// reload the user
        await user.reload().then((_) async {
          //? wait for futures ...
          await Future.wait([
            /// upload user to database
            AppUsersDBService.uploadUserOnSignIn(appUser: calcutUser),
          ]);
        });
      }
    });

    /// Do any Logic like updating the number of sign in times here
  } on FirebaseAuthException catch (e) {
    checkExceptionAndUpdate(
      firebaseAuthException: e,
      ref: ref,
      email: email,
      password: password,
    );
  } catch (e) {
    /// update authErrorTextProvider
    ref.read(authErrorTextProvider.notifier).state =
        'Error Signing In. Try Again.\nError Code: $e';
  }
}
