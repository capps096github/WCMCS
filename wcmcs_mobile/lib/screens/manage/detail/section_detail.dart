import '../../../app_exporter.dart';
import '../data/water_db_refence.dart';
import 'empty_section.dart';
import 'no_data.dart';
import 'section_data_screen.dart';

/// this shows the details of a given section including its water flow and other details
class SectionDetail extends ConsumerWidget {
  /// [SectionDetail] constructor
  const SectionDetail({
    required this.section,
    required this.color,
    super.key,
  });

  /// section
  final Section section;

  /// color
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flowCollections =
        ref.watch(sectionStreamProvider(collection: section.collection));
    // ref.watch(sectionStreamProvider(collection: section.collection));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(section.label),
      ),
      body: flowCollections.when(
        data: (docSnaphot) {
          return docSnaphot.exists
              ? SectionDataView(
                  section: section,
                  color: color,
                )
              : NoData(
                  label: 'No Water Data Available for your ${section.label}',
                  color: color,
                );
        },
        error: (error, stackTrace) => ErrorDisplay(
          error: error,
          stackTrace: stackTrace,
          showAppBar: false,
        ),
        loading: () => EmptySection(color: color),
      ),
    );
  }
}
