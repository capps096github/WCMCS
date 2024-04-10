import '../../../wcmcs_exporter.dart';

class ButtonBody extends ConsumerWidget {
  const ButtonBody({
    required this.buttonColor, required this.toolTip, required this.text, required this.textColor, required this.iconData, required this.onTap, required this.isHovered, required this.isSmallButton, super.key,
    this.iconWidget,
  });

  final bool isHovered;
  final bool isSmallButton;

  final Color buttonColor;
  final String? toolTip;
  final String text;
  final Color textColor;
  final IconData? iconData;
  final VoidCallback onTap;

  final Widget? iconWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final density = Theme.of(context).visualDensity;

    final width = MediaQuery.of(context).size.width;

       final wcmcsResponsive = ref.watch(wcmcsResponsiveProvider(context));


    final isDesktop = wcmcsResponsive.isDesktopScreen;

    /// True if It has an Icon
    final hasIconData = (iconData != null);
    final hasIconWidget = (iconWidget != null);
    final hasIcon = hasIconData || hasIconWidget;

    // elevation
    final elevation = isHovered ? spacing8 : spacing0;

    //
    return AnimatedContainer(
      width: isSmallButton ? null : (isDesktop ? width * .6 : width),
      duration: fiftyMilliseconds,
      decoration: BoxDecoration(
        color: isHovered ? buttonColor.withOpacity(.15) : wcmcsTransparent,
        borderRadius: borderRadius8,
      ),
      padding: isHovered ? padding2 : (isDesktop ? padding2 : padding0),
      clipBehavior: Clip.antiAlias,
      // for good looking UI o mobile we set this height to 42
      height: isDesktop ? kDesktopButtonHeight : kButtonHeight,
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: textColor,
                  elevation: elevation,
                  shadowColor: textColor.withOpacity(.15),
                  visualDensity: density,
                ),
                label: Text(
                  text,
                  maxLines: 1,
                ),
                icon: iconWidget ?? Icon(iconData, color: textColor),
              )
            : ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: textColor,
                  elevation: elevation,
                  visualDensity: density,
                  shadowColor: textColor.withOpacity(.15),
                ),
                child: Text(
                  text,
                  maxLines: 1,
                ),
              ),
      ),
    );
  }
}
