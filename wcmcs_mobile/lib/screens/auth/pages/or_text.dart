import '../../../app_exporter.dart';

/// OR Text just to show the OR separator in the Auth Pages to separate various Auth methods
class ORText extends ConsumerWidget {
  /// [ORText] constructor
  const ORText({
    super.key,
    this.textColor = appWhite,
    this.backgroundColor = appColor,
  });

  /// Text Color
  final Color? textColor;

  /// Background Color of the OR Text
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backColor = backgroundColor;
    final orTextColor = textColor;

    return Container(
      padding: padding8,
      margin: marginV16,
      decoration: BoxDecoration(
        color: backColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          'or',
          style: TextStyle(color: orTextColor),
        ),
      ),
    );
  }
}
