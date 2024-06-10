import '../../../app_exporter.dart';
import '../data/water_db_refence.dart';
import '../../../global/widgets/empty_section.dart';
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
        // ref.watch(sectionStreamProvider(collection: 'kitchen'));
        ref.watch(sectionStreamProvider(collection: section.collection));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(section.label),
        actions: [
          // delete section
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // pop the screen
              pop(ref);
              // delete section
              SectionService.deleteSection(section);
            },
          ),
        ],
      ),
      body: flowCollections.when(
        data: (docSnaphot) {
          // print if doc exists
          printer('Doc Exists: ${docSnaphot.exists}');

          // For the doc snapshot to exist,
          // then the section should have some variables
          // in it defioned in cloud
          // e.g name, label, collection, icon, etc

          return docSnaphot.exists
              ? SectionDataScreen(
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
