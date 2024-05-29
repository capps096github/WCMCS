import '../../../app_exporter.dart';
import 'gender.dart';

/// a chip that displays a given gender to the screen and sets it on tap
class GenderChip extends StatelessWidget {
  /// [GenderChip] constructor
  const GenderChip({
    required this.gender,
    required this.index,
    required this.isSelected,
    required this.onSelected,
    super.key,
    this.selectedColor = appColor,
    this.unselectedColor = appWhite,
  });

  /// gender to display
  final Gender gender;

  /// index
  final int index;

  /// is the chip selected
  final bool isSelected;

  /// what happens when the chip is selected
  final ValueChanged<bool>? onSelected;

  /// color when selected
  final Color selectedColor;

  /// color when unselected
  final Color unselectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ChoiceChip(
        label: Text(gender.name),
        selectedColor: selectedColor,
        backgroundColor: unselectedColor.withOpacity(0.5),
        elevation: 0,
        labelStyle: TextStyle(
          color: isSelected ? unselectedColor : selectedColor,
        ),
        avatar: CircleAvatar(
          backgroundColor: isSelected ? unselectedColor : selectedColor,
          child: Icon(
            gender.icon,
            color: isSelected ? selectedColor : unselectedColor,
            size: 14,
          ),
        ),
        selected: isSelected,
        onSelected: onSelected,
      ),
    );
  }
}
