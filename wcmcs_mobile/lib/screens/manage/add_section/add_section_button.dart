import '../../../app_exporter.dart';
import '../service/section_service.dart';
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
          /// save results to cloud
          await SectionService.uploadSection(
            Section.fromLabel(label: name, userId: appUser.userId),
          ).then((message) {
            if (mounted) {
              setState(() {
                isButtonTapped = false;
              });
            }

            /// clear the name
            ref.read(sectionNameProvider.notifier).state = '';

            /// show snackbar
            // if message contains the word successfully
            if (message.contains('successfully')) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(savedSnackbar(message));

              /// save, show ad and pop
              pop(ref);
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(errorSnackbar(message));
            }
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
SnackBar savedSnackbar(String message) {
  return SnackBar(
    backgroundColor: appColor,
    margin: const EdgeInsets.all(4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    content: Row(
      children: [
        const Icon(
          Icons.check_circle_rounded,
          color: appWhite,
        ),
        const Spacing(of: 10),
        Text(
          message,
          style: const TextStyle(color: appWhite),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    duration: oneSecond,
  );
}

/// error snackbar shown when section is not saved or it exists
SnackBar errorSnackbar(String message) {
  return SnackBar(
    backgroundColor: errorColor,
    margin: const EdgeInsets.all(4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    content: Row(
      children: [
        const Icon(
          Icons.error_outline_rounded,
          color: appWhite,
        ),
        const Spacing(of: 10),
        Text(
          'Section Not Saved - $message',
          style: const TextStyle(color: appWhite),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    duration: oneSecond,
  );
}
