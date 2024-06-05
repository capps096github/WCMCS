import '../../app_exporter.dart';

/// ? ---- Users Database ----
const usersDatabasePath = 'users';

/// Links to [usersDatabasePath] database in cloud firestore
/// final usersDatabase = FirebaseFirestore.instance.collection('appUsers');
final usersDatabaseRef = FirebaseFirestore.instance
    .collection(usersDatabasePath)
    .withConverter<AppUser>(
      fromFirestore: (snapshot, _) => AppUser.fromFirestore(snapshot.data()!),
      toFirestore: (appUser, _) => appUser.toFirestore(),
    );
