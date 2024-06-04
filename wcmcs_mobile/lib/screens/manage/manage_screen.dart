import '../../app_exporter.dart';
import 'components/add_section_card.dart';
import 'components/section_card.dart';
import 'provider.dart';

/// This is the manage screen used to manage sections
class ManageScreen extends ConsumerWidget {
  /// [ManageScreen] constructor
  const ManageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // get sections
    final sections = ref.watch(sectionsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        scrolledUnderElevation: 0,
        title: const Text('Manage Sections'),
      ),
      body: ListView(
        padding: padding16,
        children: [
          // default section cards
          ...sections.map(
            (section) => SectionCard(section: section),
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
