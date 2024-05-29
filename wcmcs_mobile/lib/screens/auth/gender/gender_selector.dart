import '../../../app_exporter.dart';
import 'gender.dart';
import 'gender_chip.dart';
import 'gender_provider.dart';

/// this is mainly used to select the gender of the user by tapping the gender chip
class GenderSelector extends StatelessWidget {
  /// [GenderSelector] constructor
  const GenderSelector({
    super.key,
    this.backgroundColor = appWhite,
    this.textColor = appColor,
    this.isPartOfRegister = false,
  });

  /// selector background color
  final Color backgroundColor;

  /// selector text color
  final Color textColor;

  /// is part of register
  final bool isPartOfRegister;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius8,
        color: isPartOfRegister
            ? backgroundColor.withOpacity(0.05)
            : backgroundColor.withOpacity(0.5),
        border: Border.all(
          color: backgroundColor,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Text(
              'Select your Gender',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isPartOfRegister ? backgroundColor : textColor,
              ),
            ),
          ),
          _GenderChips(
            selectedColor: isPartOfRegister ? backgroundColor : textColor,
            unselectedColor: isPartOfRegister ? textColor : backgroundColor,
          ),
        ],
      ),
    );
  }
}

class _GenderChips extends ConsumerStatefulWidget {
  const _GenderChips({
    required this.selectedColor,
    required this.unselectedColor,
  });

  /// color when the chip is selected
  final Color selectedColor;

  /// color when the chip is not selected
  final Color unselectedColor;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __GenderChipsState();
}

class __GenderChipsState extends ConsumerState<_GenderChips>
    with RestorationMixin {
  final RestorableIntN _indexSelected = RestorableIntN(null);

  @override
  String get restorationId => 'gender_chip_item';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_indexSelected, 'gender_chip');
  }

  @override
  void dispose() {
    _indexSelected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      /// mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: GenderChip(
            gender: genders[0],
            index: 0,
            isSelected: _indexSelected.value == 0,
            onSelected: (value) async {
              setState(() {
                _indexSelected.value = value ? 0 : -1;
                ref
                    .read(genderNotifier)
                    .setGender(genderText: value ? 'Male' : '');
              });
            },
            selectedColor: widget.selectedColor,
            unselectedColor: widget.unselectedColor,
          ),
        ),
        Expanded(
          child: GenderChip(
            gender: genders[1],
            index: 1,
            isSelected: _indexSelected.value == 1,
            onSelected: (value) {
              setState(() {
                _indexSelected.value = value ? 1 : -1;
                ref
                    .read(genderNotifier)
                    .setGender(genderText: value ? 'Female' : '');
              });
            },
            selectedColor: widget.selectedColor,
            unselectedColor: widget.unselectedColor,
          ),
        ),
      ],
    );
  }
}
