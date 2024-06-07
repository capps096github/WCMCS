import '../../../app_exporter.dart';
import 'add_section_button.dart';
import 'section_name_field.dart';

/// this is the add section page
class AddSectionScreen extends ConsumerWidget {
  /// [AddSectionScreen] constructor
  const AddSectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(sectionNameProvider);

    /// check if name is not empty and is not a space
    final isNameEmpty = spaceOnlyRegex.hasMatch(name) || name.isEmpty;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text('Add Section'),
      ),
      body: KeyboardUnfocusWrapper(
        child: Padding(
          padding: padding16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BoldTileWithDescription(
                boldTitle: BoldTitle(
                  text: 'Enter Your Section Name',
                  color: appColor,
                  fontSize: 25,
                ),
                description:
                    'Please enter the name of the section you want to add. For example, "Kitchen" or "Living Room".',
              ),
              const Spacing(of: spacing16),
              const SectionNameField(fieldColor: appColor),
              const Spacing(of: spacing16),
              if (!isNameEmpty) const AddSectionButton(),
            ],
          ),
        ),
      ),
    );
  }
}
