import '../../../app_exporter.dart';
import 'dot.dart';

/// Icon to show in the navbar of the home page
class NavbarIcon extends StatelessWidget {
  /// [NavbarIcon] constructor
  const NavbarIcon({
    required this.isSelected,
    required this.onPressed,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.label,
    required this.tooltip,
    super.key,
  });

  ///Whether the icon was selected or not
  final bool isSelected;

  ///What to do when an icon is tapped
  final VoidCallback onPressed;

  ///the [selectedIcon] to show when the icon is selected
  final IconData? selectedIcon;

  ///the [unselectedIcon] to show when the icon is not selected
  final IconData? unselectedIcon;

  ///the [label] to show when the icon is selected
  final String label;

  ///the [tooltip] to show when the icon is (not) selected
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    const selectedColor = appWhite;
    final unselectedColor = selectedColor.withOpacity(.6);

    return Tooltip(
      message: tooltip,
      decoration: const BoxDecoration(
        color: selectedColor,
        borderRadius: borderRadius4,
      ),
      child: InkWell(
        onTap: onPressed,
        child: AnimatedSwitcher(
          duration: quarterSeconds,
          child: Column(
            key: ValueKey(isSelected),
            children: [
              Center(
                child: Icon(
                  isSelected ? selectedIcon : unselectedIcon,
                  color: isSelected ? selectedColor : unselectedColor,
                ),
              ),
              const Spacing(of: spacing2),
              if (!isSelected)
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: unselectedColor,
                  ),
                ),
              if (isSelected)
                const CalcutDot(dotDiameter: 4, dotColor: selectedColor),
            ],
          ),
        ),
      ),
    );
  }
}
