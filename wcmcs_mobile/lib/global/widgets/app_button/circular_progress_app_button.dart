import '../../../app_exporter.dart';

/// A button that shows a circular progress indicator when tapped
class CircularProgressAppButton extends StatelessWidget {
  /// [CircularProgressAppButton] constructor
  const CircularProgressAppButton({
    required this.isTapped,
    required this.onTap,
    required this.text,
    required this.textColor,
    required this.buttonColor,
    super.key,
    this.icon,
    this.toolTip,
    this.shape,
    this.iconWidget,
  });

  /// whether the button is tapped or not
  final bool isTapped;

  /// callback function when button is tapped
  final VoidCallback onTap;

  /// text label for this button
  final String text;

  /// color of the text
  final Color textColor;

  /// color of the button
  final Color buttonColor;

  /// icon to be used
  final IconData? icon;

  /// tooltip for the button
  final String? toolTip;

  /// shape of the button
  final OutlinedBorder? shape;

  /// this will be rendered incase the icon is not provided
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: quarterSeconds,
      child: isTapped
          ? Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: buttonColor,
              ),
              child: CircularProgressIndicator(color: textColor),
            )
          : AppButton(
              text: text,
              onTap: onTap,
              toolTip: toolTip,
              icon: icon,
              textColor: textColor,
              buttonColor: buttonColor,
              iconWidget: iconWidget,
            ),
    );
  }
}
