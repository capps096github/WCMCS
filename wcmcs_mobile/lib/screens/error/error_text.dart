import '../../app_exporter.dart';

/// this is used to display error messages in a nice way
class ErrorText extends StatelessWidget {
  /// [ErrorText] constructor
  const ErrorText({
    required this.error,
    super.key,
  });

  /// the error that occurred
  final Object error;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: appWhite,
        borderRadius: borderRadius8,
      ),
      padding: padding16,
      child: Column(
        children: [
          const Text(
            'ERROR',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: errorColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize20,
            ),
          ),

          /// divider
          const ThickHorizontalDivider(
            thickness: 1.5,
            dividerWidth: double.infinity,
            dividerColor: errorColor,
          ),

          Text(
            '$error',
            style: const TextStyle(color: errorColor),
          ),
        ],
      ),
    );
  }
}
