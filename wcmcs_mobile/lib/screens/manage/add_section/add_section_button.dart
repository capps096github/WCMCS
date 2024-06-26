import '../../../app_exporter.dart';
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
                  .showSnackBar(successSnackbar(message));

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
