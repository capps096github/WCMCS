import '../../../app_exporter.dart';

/// Heading for the authenticaion pages showing the title and subtitle
/// e.g title = Welcome to Calcut, subtitle = Sign up for an account
class Heading extends ConsumerWidget {
  /// [Heading] constructor
  const Heading({
    required this.title,
    required this.subtitle,
    super.key,
    this.fontSize = 30,
  });

  /// title of the heading
  final String title;

  /// subtitle or description of the heading
  final String subtitle;

  /// font size of the title
  final double fontSize;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const textColor = appColor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: fontSize,
              color: textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacing(of: 4),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              color: appColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
