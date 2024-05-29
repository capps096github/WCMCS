/// select gender anfetr auth
library;

import 'dart:async';

import '../../../app_exporter.dart';

/// * Calcut Google Auth function to perform all necessary logic for Google Auth in the app
Future<void> calcutGoogleAuth() async {
  final auth = FirebaseAuth.instance;

  /// * WEB
  if (isWcmcsWeb) {
    final authProvider = GoogleAuthProvider();

    try {
      await auth.signInWithPopup(authProvider).then(uploadUserToCloud);
    } catch (e) {
      /// ignore: avoid_print
      print(e);
    }
  }

  /// * MOBILE
  else {
    final googleSignIn = GoogleSignIn();

    final googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      /// ? Logic Here
      try {
        await auth.signInWithCredential(credential).then(uploadUserToCloud);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          /// ignore: avoid_print
          print('account-exists-with-different-credential');
        } else if (e.code == 'invalid-credential') {
          /// ignore: avoid_print
          print('invalid-credential');
        }
      } catch (e) {
        /// ignore: avoid_print
        print(e);
      }
    }
  }
}

/// * Upload User to Cloud after Auth to store their credentials in our database
Future<void> uploadUserToCloud(UserCredential userCredential) async {
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
        /// Upload User
        AppUsersDBService.uploadCalcutGoogleUser(appUser: calcutUser),
      ]);
    });
  }
}
