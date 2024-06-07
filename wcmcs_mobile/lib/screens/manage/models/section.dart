import '../../../app_exporter.dart';
import 'water_flow.dart';

/// a class to represent a section in the app
/// a section can be a kitchen, washroom, etc
class Section {
  /// [Section] constructor
  Section({
    required this.label,
    required this.userId,
    required this.uploadedOn,
  });

  /// a method to convert a map to a section
  factory Section.fromFirestore(Map<String, dynamic> map) {
    return Section(
      label: map['label'] as String? ?? '',
      userId: map['userId'] as String? ?? '',
      uploadedOn: map['uploaded_on'] as Timestamp? ?? Timestamp.now(),
    );
  }

  /// from string
  factory Section.fromLabel({
    required String label,
    required String userId,
  }) {
    return Section(
      label: label,
      userId: userId,
      uploadedOn: Timestamp.now(),
    );
  }

  /// label
  final String label;

  /// user id
  final String userId;

  /// uploaded on
  final Timestamp uploadedOn;

  /// collection, is the label in lowercase, remove spaces and replace them with _
  String get collection => label.toLowerCase().replaceAll(' ', '_');

  /// collection, is the label in lowercase and remove spaces with -
  String get id => label.toLowerCase().replaceAll(' ', '-');

  /// takes in a list of water flows and returns the total
  double getLitres(List<WaterFlow> waterFlows) {
    return waterFlows.fold<double>(
      0,
      (previousValue, element) => previousValue + element.value,
    );
  }

  /// a method to convert a section to a map
  Map<String, dynamic> toFirestore() {
    final result = <String, dynamic>{}
      ..addAll({'label': label})
      ..addAll({'userId': userId})
      ..addAll({'uploaded_on': uploadedOn});
    return result;
  }

  /// gets us a copy of the section
  Section copyWith({
    String? label,
    String? userId,
    Timestamp? uploadedOn,
  }) {
    return Section(
      label: label ?? this.label,
      userId: userId ?? this.userId,
      uploadedOn: uploadedOn ?? this.uploadedOn,
    );
  }
}
