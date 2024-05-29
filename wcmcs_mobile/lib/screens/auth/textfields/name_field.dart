import 'package:flutter/cupertino.dart';

import '../../../app_exporter.dart';
import 'textfields_riverpod.dart';

/// a regular expression for to verify the user name to only characters
final nameExp = RegExp(r'^[A-Za-z ]+$');

/// use to capture the name of the user from the form
class NameField extends ConsumerWidget {
  /// [NameField] constructor
  const NameField({
    required this.fieldColor,
    super.key,
  });

  ///text field color
  final Color fieldColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      restorationId: 'name',
      onChanged: (name) {
        if (nameExp.hasMatch(name)) {
          ref.read(nameProvider.notifier).state = name;
        }

        /// print('Name: $name');
      },
      validator: (name) {
        if (name == null || name.isEmpty) {
          return ' Your Name is Required e.g. Cephas ';
        }

        if (!nameExp.hasMatch(name)) {
          return 'Name must have only Alphabets';
        }
        return null;
      },
      keyboardType: TextInputType.name,
      prefixIcon: CupertinoIcons.person,
      hintText: 'Name',
      fillColor: fieldColor,
      textColor: fieldColor,
      autofillHints: const [AutofillHints.name, AutofillHints.username],

      /// fillColor: fillColor,
    );
  }
}
