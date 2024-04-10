import '../../../wcmcs_exporter.dart';
import 'button_body.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    required this.text, required this.onTap, required this.textColor, required this.buttonColor, super.key,
    this.icon,
    this.iconWidget,
    this.toolTip,
    this.isSmallButton = false,
  });

  const AppButton.small({
    required this.text, required this.onTap, required this.textColor, required this.buttonColor, super.key,
    this.icon,
    this.toolTip,
    this.iconWidget,
    this.isSmallButton = true,
  });

  ///Wether the button is small or not
  final bool isSmallButton;
  final String text;
  final Widget? iconWidget;
  final VoidCallback onTap;
  final Color textColor;
  final Color buttonColor;
  final IconData? icon;
  final String? toolTip;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    ///This variable declares that if we are on phone
    ///, no mouse region, else we gat a mouse region
    final isPhone = !isWcmcsWeb &&
        (TargetPlatform.android == platform || TargetPlatform.iOS == platform);

    return isPhone
        ? ButtonBody(
            buttonColor: widget.buttonColor,
            toolTip: widget.toolTip,
            text: widget.text,
            textColor: widget.textColor,
            iconData: widget.icon,
            iconWidget: widget.iconWidget,
            onTap: widget.onTap,
            isHovered: isHovered,
            isSmallButton: widget.isSmallButton,
          )
        : MouseRegion(
            onHover: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: ButtonBody(
              buttonColor: widget.buttonColor,
              toolTip: widget.toolTip,
              text: widget.text,
              textColor: widget.textColor,
              iconData: widget.icon,
              iconWidget: widget.iconWidget,
              onTap: () {
                // disable hovering
                setState(() => isHovered = false);
                
                // call onTap
                widget.onTap();
              },
              isHovered: isHovered,
              isSmallButton: widget.isSmallButton,
            ),
          );
  }
}

