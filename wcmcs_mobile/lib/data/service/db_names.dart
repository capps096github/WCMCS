import '../../app_exporter.dart';

/// ? ---- Users Database ----
const usersDatabasePath = 'users';

/// Links to [usersDatabasePath] database in cloud firestore
/// final usersDatabase = FirebaseFirestore.instance.collection('appUsers');
final usersDatabaseRef = FirebaseFirestore.instance
    .collection(usersDatabasePath)
    .withConverter<AppUser>(
      fromFirestore: (snapshot, _) =>
          AppUser.fromFirestore(snapshot.data()!),
      toFirestore: (appUser, _) => appUser.toFirestore(),
    );

/* 
/// ? ---- Flavors Database ----
const flavorsDatabasePath = 'flavors';

/// Links to [flavorsDatabasePath] database in cloud firestore
/// This database is used to store the flavors of the Calcut+ app
final flavorsDatabaseRef = FirebaseFirestore.instance
    .collection(flavorsDatabasePath)
    .withConverter<CalcutFlavor>(
      fromFirestore: (snapshot, _) =>
          CalcutFlavor.fromFirestore(flavorMap: snapshot.data()!),
      toFirestore: (flavor, _) => flavor.toFirestore(),
    );

/// ? ---- SavedResults Database via User ID ----
final savedResultsDatabaseRefProvider =
    Provider<CollectionReference<CalcutSavedResult>>((ref) {
  /// current app user
  final calcutUser = ref.watch(calcutUserProvider);

  /// user id
  final userId = calcutUser.userId;

  /// const savedResultsDatabasePath = 'calcut_saved_results';
  final savedResultsDatabasePath = '$usersDatabasePath/$userId/saved_results';

  /// Links to [savedResultsDatabasePath] database in cloud firestore
  /// This database is used to store the saved results of the Calcut+ app
  final savedResultsDatabaseRef = FirebaseFirestore.instance
      .collection(savedResultsDatabasePath)
      .withConverter<CalcutSavedResult>(
        fromFirestore: (snapshot, _) => CalcutSavedResult.fromFirestore(
          resultMap: snapshot.data()!,
        ),
        toFirestore: (savedResult, _) => savedResult.toFirestore(),
      );

  return savedResultsDatabaseRef;
});
 */
