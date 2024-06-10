import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app_exporter.dart';
import '../model/tank.dart';

part 'tank_db_reference.g.dart';

/// * collection
const tankCollection = 'tanks';

/// * collection reference
/// this is the reference to the sections collection
final tankDatabaseRef =
    FirebaseFirestore.instance.collection(tankCollection).withConverter<Tank>(
          fromFirestore: (snapshot, _) => Tank.fromFirestore(
            snapshot.data()!,
          ),
          toFirestore: (tank, _) => tank.toFirestore(),
        );

/// this gets us the stream of sections
// @Riverpod(keepAlive: true)
@riverpod
Stream<DocumentSnapshot<Tank>> tankStream(
  TankStreamRef ref,
) {
  final appUser = ref.watch(appUserProvider);

  // this document has subcollections in it, so get the document ids for those documents
  // listen to the document snapshots
  final docSnapshots = tankDatabaseRef.doc(appUser.userId).snapshots();

  // print
  printer('Doc Snapshots: $docSnapshots');

  return docSnapshots;
}

/// returns the current user
// @Riverpod(keepAlive: true)
@riverpod
Tank userTank(UserTankRef ref) {
  /// listen to the user stream
  final tankStream = ref.watch(tankStreamProvider);

  final tank = tankStream.whenData((DocumentSnapshot<Tank> tankSnaphot) {
    return tankSnaphot.data();
  }).value;

  printer('Current Tank is: $tank');

  return tank ?? Tank.empty();
}
