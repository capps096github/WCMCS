import '../../../app_exporter.dart';

///Name provider
final sectionNameProvider = StateProvider<String>((ref) => '');

/// regex to check whether a string is made up of only spaces
final RegExp spaceOnlyRegex = RegExp(r'^\s*$');

/// use to capture the name of the user from the form
class SectionNameField extends ConsumerWidget {
  /// [SectionNameField] constructor
  const SectionNameField({
    required this.fieldColor,
    super.key,
  });

  ///text field color
  final Color fieldColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      restorationId: 'section_name',
      onChanged: (name) {
        ref.read(sectionNameProvider.notifier).state = name;
      },
      validator: (name) {
        if (name == null || name.isEmpty) {
          return ' Your Section Name is Required e.g. Kitchen ';
        }

          if (spaceOnlyRegex.hasMatch(name)) {
                return "Section Name can't have spaces only";
              }

        return null;
      },
      style: TextStyle(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        color: fieldColor,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      hasUnderlinedDecoration: true, keyboardType: TextInputType.name,
      hintText: 'Section Name',
      fillColor: fieldColor,
      textColor: fieldColor,

      /// fillColor: fillColor,
    );
  }
}
