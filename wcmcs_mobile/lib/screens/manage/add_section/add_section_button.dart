import '../../../app_exporter.dart';
import '../data/section_service.dart';
import 'section_name_field.dart';

/// On tap of this, it take the user to a screen showing courses we've suggested for them
class AddSectionButton extends ConsumerStatefulWidget {
  /// [AddSectionButton] constructor
  const AddSectionButton({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SaveButtonState();
}

class _SaveButtonState extends ConsumerState<AddSectionButton> {
  /// isButtonTapped
  bool isButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(sectionNameProvider);
    final appUser = ref.watch(appUserProvider);

    return Padding(
      padding: padding8,
      child: CircularProgressAppButton(
        isTapped: isButtonTapped,
        onTap: () async {
          /// unfocus
          final currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }

          // set the button to be tapped
          setState(() {
            isButtonTapped = true;
          });

          /// wait for futures
          await Future.wait([
            /// save results to cloud
            SectionService.uploadSection(
              Section.fromLabel(label: name, userId: appUser.userId),
            ),
          ]).then((_) {
            if (mounted) {
              setState(() {
                isButtonTapped = false;
              });
            }

            /// clear the name
            ref.read(sectionNameProvider.notifier).state = '';

            /// show snackbar
            ScaffoldMessenger.of(context).showSnackBar(savedSnackbar());

            /// save, show ad and pop
            pop(ref);
          });
        },
        textColor: appWhite,
        buttonColor: appColor,
        text: 'Add Section',
      ),
    );
  }
}

/// snackbar to show after saving results
SnackBar savedSnackbar() {
  return SnackBar(
    backgroundColor: appColor,
    margin: const EdgeInsets.all(4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    content: const Row(
      children: [
        Icon(
          Icons.check_circle_rounded,
          color: appWhite,
        ),
        Spacing(of: 10),
        Text(
          'Section Saved Successfully',
          style: TextStyle(color: appWhite),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    duration: oneSecond,
  );
}
