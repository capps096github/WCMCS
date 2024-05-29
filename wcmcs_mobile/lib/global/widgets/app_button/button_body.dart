import '../../../app_exporter.dart';

/// this is the body of the `AppButton`
class ButtonBody extends ConsumerWidget {
  /// [ButtonBody] constructor
  const ButtonBody({
    required this.buttonColor,
    required this.toolTip,
    required this.text,
    required this.textColor,
    required this.iconData,
    required this.onTap,
    required this.isSmallButton,
    super.key,
    this.iconWidget,
  });

  /// whether this is a small button
  final bool isSmallButton;

  /// color of the button
  final Color buttonColor;

  /// tooltip for the button
  final String? toolTip;

  /// text label
  final String text;

  /// color of the text
  final Color textColor;

  /// icon to be used in the button
  final IconData? iconData;

  /// callback function when button is tapped
  final VoidCallback? onTap;

  /// widget to be used as icon
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final density = Theme.of(context).visualDensity;

    final width = MediaQuery.of(context).size.width;

    final wcmcsResponsive = ref.watch(appResponsiveProvider(context));

    final isDesktop = wcmcsResponsive.isDesktopScreen;
    final isMobile = wcmcsResponsive.isMobileScreen;

    /// True if It has an Icon
    final hasIconData = (iconData != null);
    final hasIconWidget = (iconWidget != null);
    final hasIcon = hasIconData || hasIconWidget;

    /// elevation
    const elevation = 0.0;

    //
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: buttonColor,
      foregroundColor: textColor,
      elevation: elevation,
      shape: const StadiumBorder(),
      shadowColor: textColor.withOpacity(.2),
      visualDensity: density,
      textStyle: TextStyle(
        fontFamily: wcmcsFontFamily,
        fontSize: isDesktop ? 16 : 14,
        fontWeight: FontWeight.w600,
      ),
    );

    //
    return AnimatedContainer(
      width: isSmallButton ? null : (isMobile ? width : maxAuthWidth),
      duration: fiftyMilliseconds,

      /// for good looking UI o mobile we set this height to 42
      height: isDesktop ? 56 : wcmcsButtonHeight,
      child: Tooltip(
        message: toolTip ?? text,
        textStyle: TextStyle(color: buttonColor),
        decoration: BoxDecoration(
          color: textColor,
          borderRadius: borderRadius4,
        ),
        child: hasIcon
            ? ElevatedButton.icon(
                onPressed: onTap,
                style: buttonStyle,
                label: Text(
                  text,
                  maxLines: 1,
                ),
                icon: iconWidget ?? Icon(iconData, color: textColor),
              )
            : ElevatedButton(
                onPressed: onTap,
                style: buttonStyle,
                child: Text(
                  text,
                  maxLines: 1,
                ),
              ),
      ),
    );
  }
}
