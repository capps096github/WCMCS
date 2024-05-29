import '../../../app_exporter.dart';

/// Official Text Button for the app

class AppTextButton extends StatelessWidget {
  /// [AppTextButton] constructor
  const AppTextButton({
    required this.onTap,
    required this.textColor,
    required this.buttonColor,
    required this.text,
    super.key,
    this.toolTip,
  });

  /// callback function when button is tapped
  final VoidCallback onTap;

  /// color of the text
  final Color textColor;

  /// color of the button
  final Color buttonColor;

  /// text: The text to be displayed on the button
  final String text;

  /// tooltip: The tooltip to show when the user hovers over the button.
  final String? toolTip;

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: textColor,
          fontSize: 16,
        );

    final density = Theme.of(context).visualDensity;

    return Tooltip(
      message: toolTip ?? text,
      textStyle: TextStyle(color: buttonColor),
      decoration: BoxDecoration(
        color: textColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: buttonColor,
          visualDensity: density,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Text(
            text,
            maxLines: 1,
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
