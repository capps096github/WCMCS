import '../../../app_exporter.dart';
import '../service/tank_service.dart';

/// On tap of this, it take the user to a screen showing courses we've suggested for them
class AddTankButton extends ConsumerStatefulWidget {
  /// [AddTankButton] constructor
  const AddTankButton({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SaveButtonState();
}

class _SaveButtonState extends ConsumerState<AddTankButton> {
  /// isButtonTapped
  bool isButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    // form key
    final tankFormKey = ref.watch(tankFormKeyProvider);

    // tank
    final tank = ref.watch(tankProvider);

    return CircularProgressAppButton(
      isTapped: isButtonTapped,
      onTap: () async {
        /// unfocus
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        if (tankFormKey.currentState!.validate()) {
          // set the button to be tapped
          setState(() {
            isButtonTapped = true;
          });

          /// wait for futures
          /// save results to cloud
          await TankService.uploadTank(tank).then((_) {
            if (mounted) {
              setState(() {
                isButtonTapped = false;
              });
            }

            // / clear the name
            resetTankProviders(ref);

            // / show snackbar
            // if message contains the word successfully
            ScaffoldMessenger.of(context)
                .showSnackBar(successSnackbar('Tank added successfully'));

            /// save, show ad and pop
            pop(ref);
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            errorSnackbar('Please fill in all fields'),
          );
        }
      },
      textColor: appWhite,
      buttonColor: appColor,
      text: 'ADD TANK',
    );
  }
}
