import '../../app_exporter.dart';

/// This displays a big heading 1 kind of title on a given page with
///  further customizations too
class BoldTitle extends StatelessWidget {
  /// [BoldTitle] constructor
  const BoldTitle({
    required this.text,
    super.key,
    this.color = appWhite,
    this.fontSize = 35,
    this.textAlign = TextAlign.center,
  });

  /// text to use as the title
  final String text;

  /// text color
  final Color color;

  /// text font size
  final double? fontSize;

  /// text alignment
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

/// bold title and description widget
class BoldTileWithDescription extends StatelessWidget {
  /// [BoldTileWithDescription] constructor
  const BoldTileWithDescription({
    required this.boldTitle,
    required this.description,
    super.key,
    this.color,
    this.descFontSize,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  /// [BoldTitle] tile
  final BoldTitle boldTitle;

  /// description
  final String description;

  /// text align
  final TextAlign? textAlign;

  /// text color
  final Color? color;

  /// description font size
  final double? descFontSize;

  /// cross alignment font size
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        boldTitle,
        const Spacing(of: spacing2),
        // description
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: descFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
