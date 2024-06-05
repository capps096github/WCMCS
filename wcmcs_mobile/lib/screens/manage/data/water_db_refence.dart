import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app_exporter.dart';
import '../models/water_flow.dart';

part 'water_db_refence.g.dart';

/// return the water flow of a given section
List<WaterFlow> getWaterFlows(QuerySnapshot<WaterFlow> querySnapshot) {
  // * get waterflows from stream
  final waterFlowList = querySnapshot.docs
      .map(
        (QueryDocumentSnapshot<WaterFlow> flavorDocSnapshot) =>
            flavorDocSnapshot.data(),
      )
      .toList();

  // print
  printer(waterFlowList);

  return waterFlowList;
}

/// returns a query snapshot
/// and also if possible takes in a date
// Non autoDispose provider
@Riverpod(keepAlive: true)
Stream<QuerySnapshot<WaterFlow>> waterFlowStream(
  WaterFlowStreamRef ref, {
  required String collection,
}) {
  final date = ref.watch(dashDateProvider());

  // * collection
  final waterFlowCollection = 'sections/$collection/$date';

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

  return waterFlowStream;
}

/// this returns the date in dashed format of 3-4-2024
// Non autoDispose provider
@Riverpod(keepAlive: true)
String dashDate(DashDateRef ref, {DateTime? dateTime}) {
  final now = dateTime ?? DateTime.now();

  final date = '${now.day}-${now.month}-${now.year}';
  return date;
}
