import '../../../app_exporter.dart';

/// for reading water flow data from the database
class WaterFlow {
  /// constructor
  WaterFlow({required this.value, required this.timestamp});

  /// convert from firebase
  factory WaterFlow.fromFirestore(Map<String, dynamic> map) {
    return WaterFlow(
      value: map['value'] as num? ?? 0.0,
      timestamp: map['timestamp'] as Timestamp? ?? Timestamp.now(),
    );
  }

  /// value
  final num value;

  /// timestamp
  final Timestamp timestamp;

  /// convert to map
  Map<String, dynamic> toFirestore() {
    final result = <String, dynamic>{}
      ..addAll({'value': value})
      ..addAll({'timestamp': timestamp});

    return result;
  }

  /// getter for date
  String get date => dateFormatter.format(timestamp.toDate());
  /// get only the time from the timestamp
  String get time => timeFormatter.format(timestamp.toDate());
}
