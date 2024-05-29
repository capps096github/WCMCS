import '../../../app_exporter.dart';
import 'button_body.dart';

/// Official App Button for the app
class AppButton extends StatelessWidget {
  /// App Button constructor
  const AppButton({
    required this.text,
    required this.onTap,
    required this.textColor,
    required this.buttonColor,
    super.key,
    this.icon,
    this.iconWidget,
    this.toolTip,
    this.isSmallButton = false,
  });

  /// small size of this [AppButton]
  static Widget small({
    required String text,
    required VoidCallback onTap,
    required Color textColor,
    required Color buttonColor,
    IconData? icon,
    Widget? iconWidget,
    String? toolTip,
  }) =>
      AppButton(
        text: text,
        onTap: onTap,
        textColor: textColor,
        buttonColor: buttonColor,
        icon: icon,
        iconWidget: iconWidget,
        toolTip: toolTip,
        isSmallButton: true,
      );

  ///Wether the button is small or not
  final bool isSmallButton;

  /// text label
  final String text;

  /// widget to be used as icon
  final Widget? iconWidget;

  /// callback function when button is tapped
  final VoidCallback? onTap;

  /// color of the text
  final Color textColor;

  /// color of the button
  final Color buttonColor;

  /// icon to be used
  final IconData? icon;

  /// tooltip for the button
  final String? toolTip;

  @override
  Widget build(BuildContext context) {
    return ButtonBody(
      buttonColor: buttonColor,
      toolTip: toolTip,
      text: text,
      textColor: textColor,
      iconData: icon,
      iconWidget: iconWidget,
      onTap: onTap,
      isSmallButton: isSmallButton,
    );
  }
}
