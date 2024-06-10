import '../../../app_exporter.dart';
import '../model/tank.dart';

/// A service for interacting with the Tank on the Cloud Database
class TankService {
  /// ? ---- Tank Database Service ----
  ///This function uploads the user to cloud under the []
  static Future<void> uploadTank(Tank section) async {
    await tankDatabaseRef
        .doc(section.userId)
        .set(
          section,
          SetOptions(merge: true),
        )
        .then((_) => printer('Tank uploaded successfully'));
  }
}
