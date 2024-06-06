import '../../../app_exporter.dart';
import '../data/water_db_refence.dart';
import 'empty_section.dart';
import 'section_data_body.dart';
import 'water_flow_calendar.dart';

/// this shows the details of a given section including its water flow and other details
class SectionDataView extends ConsumerWidget {
  /// [SectionDataView] constructor
  const SectionDataView({
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
    final dailyWaterFlows =
        ref.watch(dailyWaterFlowStreamProvider(collection: section.collection));

    return Column(
      children: [
        // calendar horizontal
        WaterFlowCalendar(activeColor: color),

        // spacing
        const Spacing(of: spacing16),

        // show the data
        Expanded(
          child: dailyWaterFlows.when(
            data: (waterFlows) {
              return waterFlows.isEmpty
                  ? EmptySection(
                      label: 'No Water Collected Today in the ${section.label}',
                      color: color,
                    )
                  : SectionDataBody(
                      section: section,
                      color: color,
                      waterFlows: waterFlows,
                    );
            },
            error: (error, stackTrace) => ErrorDisplay(
              error: error,
              stackTrace: stackTrace,
            ),
            loading: () => EmptySection(color: color),
          ),
        ),
      ],
    );
  }
}
