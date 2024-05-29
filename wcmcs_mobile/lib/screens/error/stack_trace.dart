import '../../app_exporter.dart';

/// this widget displays the stack trace of an error
class StackTraceWidget extends StatelessWidget {
  ///  [StackTraceWidget] constructor
  const StackTraceWidget({
    required this.stackTrace,
    super.key,
  });

  /// the stack trace to display
  final StackTrace stackTrace;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius8,
        color: errorYellow.withOpacity(.1),
        border: Border.all(color: errorYellow),
      ),
      margin: verticalPadding16,
      padding: padding16,
      child: Column(
        children: [
          const Text(
            'STACK TRACE',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: errorYellow,
              fontWeight: FontWeight.bold,
              fontSize: fontSize20,
            ),
          ),

          /// divider
          const ThickHorizontalDivider(
            thickness: 1.5,
            dividerWidth: double.infinity,
            dividerColor: errorYellow,
          ),

          Text(
            '$stackTrace',
            style: TextStyle(
              color: errorYellow.withOpacity(.8),
            ),
          ),
        ],
      ),
    );
  }
}
