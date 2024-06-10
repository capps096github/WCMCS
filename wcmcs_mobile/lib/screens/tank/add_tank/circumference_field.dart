import 'package:flutter/cupertino.dart';

import '../../../app_exporter.dart';

/// a regular expression to accept only numbers
final numberExp = RegExp(r'^[0-9]+$');

/// use to capture the number of the user from the form
class NumberField extends ConsumerWidget {
  /// [NumberField] constructor
  const NumberField({
    required this.fieldLabel,
    required this.numberProvider,
    super.key,
  });

  /// text field color
  final String fieldLabel;

  /// number provider
  final StateProvider<num> numberProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return CustomTextField(
      restorationId: fieldLabel.toLowerCase(),
      onChanged: (number) {
        ref.read(numberProvider.notifier).state = int.parse(number);
      },
      validator: (number) {
        if (number == null || number.isEmpty) {
          return 'Your Tank $fieldLabel is Required e.g. 1234';
        }

        if (!numberExp.hasMatch(number)) {
          return 'Only numbers allowed e.g. 1234';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      prefixIcon: CupertinoIcons.number,
      hintText: '$fieldLabel of your Tank (in m)',
    );
  }
}
