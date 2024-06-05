import '../../../app_exporter.dart';

/// a class to represent a section in the app
/// a section can be a kitchen, washroom, etc
class Section {
  /// [Section] constructor
  Section({
    required this.label,
    required this.icon,
    required this.litres,
  });

  /// label
  final String label;

  /// collection, is the label in lowercase, remove spaces and replace them with _
  String get collection => label.toLowerCase().replaceAll(' ', '_');

  /// collection, is the label in lowercase and remove spaces with -
  String get id => label.toLowerCase().replaceAll(' ', '-');

  /// icon
  final IconData icon;

  /// litres
  final double litres;
}
