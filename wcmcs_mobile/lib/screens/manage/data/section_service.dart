import '../../../app_exporter.dart';
import 'water_db_refence.dart';

/// A service for interacting with the Calcut Cloud Database
class SectionService {
  /// ? ---- Sections Database Service ----
  ///This function uploads the user to cloud under the []
  static Future<void> uploadSection(Section section) async => sectionDatabaseRef
      .doc(section.collection)
      .set(
        section,
        SetOptions(merge: true),
      )
      .then((_) => printer('Section uploaded successfully'));
}
