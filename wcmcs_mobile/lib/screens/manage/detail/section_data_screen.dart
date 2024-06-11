import '../../../app_exporter.dart';
import '../data/water_db_refence.dart';
import '../models/water_collected.dart';
import 'components/tap_switch.dart';
import 'components/water_flow_calendar.dart';
import 'no_data.dart';
import 'section_data_body.dart';

/// this shows the details of a given section including its water flow and other details
class SectionDataScreen extends ConsumerWidget {
  /// [SectionDataScreen] constructor
  const SectionDataScreen({
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

    return ListView(
      children: [
        // spacing
        if (isAppWeb) const Spacing(of: spacing32), // calendar horizontal
        WaterFlowCalendar(activeColor: color),

        // spacing
        const Spacing(of: spacing16),

        // show the data
        dailyWaterFlows.when(
          data: (waterFlows) {
            return BodyWidth(
              body: AnimatedSwitcher(
                duration: oneSecond,
                child: waterFlows.isEmpty
                    ? Padding(
                        padding: padding16,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacing(of: spacing16),
                            BoldTitle(
                              text: 'Tap Status',
                              color: color,
                              fontSize: 30,
                            ),
                            const Spacing(of: spacing16),
                            SectionTapSwitch(section: section),
                            // switch
                            NoData(
                              label:
                                  'No Water Collected Today in the ${section.label}',
                              color: color,
                            ),
                            const Spacing(of: spacing16),
                          ],
                        ),
                      )
                    : SectionDataBody(
                        section: section,
                        color: color,
                        waterCollected: WaterCollected(waterFlows: waterFlows),
                      ),
              ),
            );
          },
          error: (error, stackTrace) => ErrorDisplay(
            error: error,
            stackTrace: stackTrace,
          ),
          loading: () => EmptySection(color: color, hasColumn:true),
        ),
      ],
    );
  }
}
