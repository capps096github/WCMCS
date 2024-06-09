import '../../app_exporter.dart';
import 'db_names.dart';

/// A provider for the [AppUsersDBService]
final calcutDBServiceProvider = Provider.autoDispose<AppUsersDBService>((ref) {
  final appUser = ref.watch(appUserProvider);

  //
  return AppUsersDBService(appUser: appUser);
});

/// A service for interacting with the Calcut Cloud Database
class AppUsersDBService {
  ///we make this take in the current app user so that we don't have to manually pass it in all the time
  AppUsersDBService({required this.appUser});

  /// curreent app user at the moment
  final AppUser appUser;

  /// * Static Methods --------------------------------------------------------------------------------

  /// ? ---- Users Database Service ----
  ///This function uploads the user to cloud under the [usersDatabaseRef]
  static Future<void> uploadAppUser({required AppUser appUser}) async =>
      usersDatabaseRef
          .doc(appUser.userId)
          .set(
            appUser,
            SetOptions(merge: true),
          )
          .then((_) => printer('User uploaded successfully'));

  /// upload user on sign in incase they are new and don't exist in our database yet
  static Future<void> uploadUserOnSignIn({
    required AppUser appUser,
  }) async =>
      usersDatabaseRef.doc(appUser.userId).get().then((user) async {
        if (user.exists) {
          //user exists then just return
          return;
        } else {
          //user doesn't exist - create and upload a new user in firestore
          await uploadAppUser(appUser: appUser);
        }
      });

  ///This function uploads the google user to cloud under the [usersDatabaseRef]
  static Future<void> uploadGoogleUser({
    required AppUser appUser,
  }) async =>
      usersDatabaseRef.doc(appUser.userId).get().then((user) async {
        if (user.exists) {
          //user exists then just return
          return;
        } else {
          //user doesn't exist - create and upload a new user in firestore
          await uploadAppUser(appUser: appUser);
        }
      });

  /// This function deletes the user from the cloud
  static Future<void> deleteCalcutUser({required String userId}) async =>
      usersDatabaseRef.doc(userId).delete();

}
