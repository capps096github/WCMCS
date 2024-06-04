// sections provider
import '../../app_exporter.dart';
import 'data/section_data.dart';

/// this returns a list of sections in which we shall be monitoring water from
final sectionsProvider = Provider<List<Section>>((ref) {
  return defaultSections;
});
