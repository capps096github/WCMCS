import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app_exporter.dart';
import '../models/water_flow.dart';
import 'selected_date_provider.dart';

part 'water_db_refence.g.dart';

/// this gets us the stream of sections
@Riverpod(keepAlive: true)
Stream<DocumentSnapshot<Map<String, dynamic>>> sectionStream(
  SectionStreamRef ref, {
  required String collection,
}) {
  // * collection
  const sectionWaterCollection = 'sections';

  // this document has subcollections in it, so get the document ids for those documents
  // listen to the document snapshots
  final docSnapshots = FirebaseFirestore.instance
      .collection(sectionWaterCollection)
      .doc(collection)
      .snapshots();

  // print
  printer('Doc Snapshots: $docSnapshots');

  return docSnapshots;
}

/// this returns the water flow stream of a given date
@riverpod
Stream<List<WaterFlow>> dailyWaterFlowStream(
  DailyWaterFlowStreamRef ref, {
  required String collection,
}) {
  final dashedDate = ref.watch(selectedDateProvider);

  // * collection
  final waterFlowCollection = 'sections/$collection/$dashedDate';

  // * collection reference
  final waterFlowDatabaseRef = FirebaseFirestore.instance
      .collection(waterFlowCollection)
      .withConverter<WaterFlow>(
        fromFirestore: (snapshot, _) => WaterFlow.fromFirestore(
          snapshot.data()!,
        ),
        toFirestore: (waterFlow, _) => waterFlow.toFirestore(),
      );

// * data stream
  final waterFlowStream =
      waterFlowDatabaseRef.orderBy('uploaded_on').snapshots();

// * get waterflows from stream
  final waterFlowList = waterFlowStream.map(
    (querySnapshot) => querySnapshot.docs
        .map(
          (docSnapshot) => docSnapshot.data(),
        )
        .toList(),
  );

  // print
  printer(waterFlowList);

  return waterFlowList;
}

// * ------------------- Sections -------------

/// * collection
const sectionWaterCollection = 'sections';

/// * collection reference
/// this is the reference to the sections collection
final sectionDatabaseRef = FirebaseFirestore.instance
    .collection(sectionWaterCollection)
    .withConverter<Section>(
      fromFirestore: (snapshot, _) => Section.fromFirestore(
        snapshot.data()!,
      ),
      toFirestore: (section, _) => section.toFirestore(),
    );

/// read sections
@riverpod
Stream<List<Section>> sections(SectionsRef ref) {
  // sections stream
  final sectionsStream = sectionDatabaseRef.orderBy('uploaded_on').snapshots();

  // get sections from stream
  final allSections = sectionsStream.map(
    (querySnapshot) => querySnapshot.docs
        .map(
          (docSnapshot) => docSnapshot.data(),
        )
        .toList(),
  );

  // get user
  final appUser = ref.watch(appUserProvider);

  // filter the sections to return only those with the user id
  final sectionsList = allSections.map(
    (sections) => sections
        .where(
          (section) => section.userId == appUser.userId,
        )
        .toList(),
  );

  // print
  printer(sectionsList);

  return sectionsList;
}
