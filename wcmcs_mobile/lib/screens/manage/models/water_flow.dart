import '../../../app_exporter.dart';

/// for reading water flow data from the database
class WaterFlow {
  /// constructor
  WaterFlow({required this.value, required this.uploadedOn});

  /// convert from firebase
  factory WaterFlow.fromFirestore(Map<String, dynamic> map) {
    return WaterFlow(
      value: map['value'] as num? ?? 0.0,
      uploadedOn: map['uploaded_on'] as Timestamp? ?? Timestamp.now(),
    );
  }

  /// value
  final num value;

  /// timestamp
  final Timestamp uploadedOn;

  /// convert to map
  Map<String, dynamic> toFirestore() {
    final result = <String, dynamic>{}
      ..addAll({'value': value})
      ..addAll({'uploaded_on': uploadedOn});

    return result;
  }

  /// getter for date
  String get date => dateFormatter.format(uploadedOn.toDate());

  /// get only the time from the timestamp
  String get time => timeFormatter.format(uploadedOn.toDate());
}
