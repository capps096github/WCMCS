import '../../../app_exporter.dart';

/// Card Gradient to show the gradient in the card
class CardGradient extends StatelessWidget {
  /// [CardGradient] constructor
  const CardGradient({
    super.key,
    this.gradientColor = appColor,
    this.borderRadius = borderRadius8,
  });

  /// max card height
  final Color gradientColor;

  /// border radius of the card
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    //
    return Container(
      width: double.infinity,
      height: maxCardHeight,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            appTransparent,
            appTransparent,
            gradientColor.withOpacity(0.25),
            gradientColor.withOpacity(0.5),
            gradientColor.withOpacity(0.8),
            gradientColor,
            gradientColor,
          ],
        ),
      ),
    );
  }
}
