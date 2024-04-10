import '../../wcmcs_exporter.dart';

/// This displays a big heading 1 kind of title on a given page with
///  further customizations too
class BoldTitle extends StatelessWidget {
  /// [BoldTitle] constructor
  const BoldTitle({
    required this.text,
    super.key,
    this.color = wcmcsWhite,
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
  const BoldTileWithDescription(
      {required this.boldTitle, required this.description, super.key});

  /// [BoldTitle] tile
  final BoldTitle boldTitle;

  /// description
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        boldTitle,
        const Spacing(of: spacing2),
        // description
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
