import '../../../app_exporter.dart';
import '../data/water_db_refence.dart';
import 'no_data.dart';
import 'section_data.dart';

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
    // get a list of water flows
    // final waterFlows =
    //     ref.watch(waterFlowsProvider(collection: section.collection));
    final waterFlowStream =
        ref.watch(waterFlowStreamProvider(collection: section.collection));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(section.label),
      ),
      body: waterFlowStream.when(
        data: (querySnapshot) {
          // get list of water flows
          final waterFlows = getWaterFlows(querySnapshot);

          return waterFlows.isEmpty
              ? NoData(section: section, color: color)
              : SectionData(
                  section: section,
                  color: color,
                  waterFlows: waterFlows,
                );
        },
        error: (error, stackTrace) => ErrorDisplay(
          error: error,
          stackTrace: stackTrace,
        ),
        loading: () => Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ),
    );
  }
}
