import '../../app_exporter.dart';
import 'components/add_section_card.dart';
import 'components/section_card.dart';
import 'data/water_db_refence.dart';

/// This is the manage screen used to manage sections
class ManageScreen extends ConsumerWidget {
  /// [ManageScreen] constructor
  const ManageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // get sections
    final sectionStream = ref.watch(sectionsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        scrolledUnderElevation: 0,
        title: const Text('Manage Sections'),
      ),
      body: ListView(
        padding: padding16,
        children: [
          // stream
          AnimatedSwitcher(
            duration: oneSecond,
            child: sectionStream.when(
              data: (sections) {
                return Column(
                  children: [
                    // default section cards
                    ...sections.map(
                      (section) => SectionCard(section: section),
                    ),
                  ],
                );
              },
              error: (error, stackTrace) => ErrorDisplay(
                error: error,
                stackTrace: stackTrace,
              ),

              // loading
              loading: () => ShimmerAnimation(
                color: appColor.withOpacity(.5),
                child: Column(
                  children: [
                    // list
                    ...List.generate(
                      5,
                      (index) => const LoadingContainer(
                        height: 350,
                        margin: marginV4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const Spacing(of: spacing16),
          // add section button
          const AddSectionCard(),
          const Spacing(of: spacing16),
        ],
      ),
    );
  }
}
