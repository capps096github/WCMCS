import '../../app_exporter.dart';
import '../service/db_names.dart';

/// currenty logggen in user streamProvider
final currentUserStreamProvider =
    StreamProvider<DocumentSnapshot<AppUser>>((ref) {
  final user = FirebaseAuth.instance.currentUser;

  return usersDatabaseRef
      .doc(user!.uid)
      .snapshots(includeMetadataChanges: true);
});

/// * Current user from ID
final userFromIdStreamProvider = StreamProvider.autoDispose
    .family<DocumentSnapshot<AppUser>, String>((ref, userId) {
  return usersDatabaseRef.doc(userId).snapshots();
});

/// * A list of all testers
final allUserStreamProvider = StreamProvider<QuerySnapshot<AppUser>>((ref) {
  return usersDatabaseRef.where('isTester', isEqualTo: true).snapshots();
});

/// appUserProvider make it dispose when no longer needed
//* more infor here https://riverpod.dev/docs/concepts/modifiers/auto_dispose/
final appUserProvider = StateProvider<AppUser>((ref) {
  /// listen to the user stream
  final userStream = ref.watch(currentUserStreamProvider);

  final appUser =
      userStream.whenData((DocumentSnapshot<AppUser> userSnaphot) {
    return userSnaphot.data();
  }).value;

  /// print this calcut user as string
  /// ignore: avoid_print
  print('Current Calcut User is: $appUser');
  
  return appUser ?? AppUser.fromFirebaseUser();
});
