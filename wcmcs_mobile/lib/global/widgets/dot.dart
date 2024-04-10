import '../../wcmcs_exporter.dart';

/// THis is a dot in a bullet=like format
///

class Dot extends StatelessWidget {
  const Dot({
    super.key,
    this.dotColor = wcmcsColor,
    this.dotDiameter = spacing8,
    this.margin = margin4,
  });

  // color of the dot
  final Color dotColor;

  // diameter of the dot
  final double dotDiameter;

  // margin of the dot
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dotDiameter,
      height: dotDiameter,
      margin: margin,
      decoration: BoxDecoration(
        color: dotColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
