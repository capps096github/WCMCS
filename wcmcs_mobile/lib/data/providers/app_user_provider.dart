import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app_exporter.dart';
import '../service/db_names.dart';

part 'app_user_provider.g.dart';

/// currenty logggen in user streamProvider
// @Riverpod(keepAlive: true)
@riverpod
Stream<DocumentSnapshot<AppUser>> appUserStream(AppUserStreamRef ref) {
  final user = FirebaseAuth.instance.currentUser;

  return usersDatabaseRef
      .doc(user!.uid)
      .snapshots(includeMetadataChanges: true);
}

/// returns the current user
// @Riverpod(keepAlive: true)
@riverpod
AppUser appUser(AppUserRef ref) {
  /// listen to the user stream
  final userStream = ref.watch(appUserStreamProvider);

  final appUser = userStream.whenData((DocumentSnapshot<AppUser> userSnaphot) {
    return userSnaphot.data();
  }).value;

  printer('Current Calcut User is: $appUser');

  return appUser ?? AppUser.fromFirebaseUser();
}
