import 'package:restart_app/restart_app.dart';

import '../../wcmcs_exporter.dart';
import 'error_text.dart';
import 'stack_trace.dart';

/// A widget to display errors and stack traces when a given error occurs
class ErrorDisplay extends StatelessWidget {
  /// [ErrorDisplay] constructor
  const ErrorDisplay({
    required this.stackTrace,
    required this.error,
    super.key,
  });

  /// current stack trace of the error
  final StackTrace stackTrace;

  /// the error that occurred
  final Object error;

  @override
  Widget build(BuildContext context) {
    printer('Error: $error');
    printer('Happened During: $stackTrace');

    //
    return Scaffold(
      backgroundColor: errorColor,
      appBar: AppBar(
        backgroundColor: errorColor,
        leading: Consumer(
          builder: (_, ref, __) {
            return CloseButton(
              color: wcmcsWhite,
              onPressed: () => go(ref, to: homePath),
            );
          },
        ),
        title: const AppLogo(logoSize: 32),
      ),
      body: Padding(
        padding: horizontalPadding16,
        child: ExpandedScrollingColumn(
          children: [
            const Spacing(of: spacing24),
            const BoldTitle(
              text: 'Oops! Something went wrong',
              fontSize: fontSize24,
            ),
            const Spacing(of: spacing8),
            const Text(
              "No worries, we'll get right on it. It's probably just a temporary glitch on our end.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: wcmcsWhite,
              ),
            ),
            const Spacing(of: spacing32),
            ErrorText(error: error),
            StackTraceWidget(stackTrace: stackTrace),
            const Spacing(of: spacing16),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: errorColor,
        padding: padding16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ThickHorizontalDivider(
              thickness: 1.5,
              dividerWidth: double.infinity,
              dividerColor: wcmcsWhite,
              margin: margin0,
            ),
            const Spacing(of: spacing8),

            /// go to safety
            AppButton(
              text: 'Go to Safety',
              buttonColor: wcmcsWhite,
              textColor: wcmcsColor,
              iconWidget: const AppLogo(logoSize: 24),
              onTap: () {
                Restart.restartApp(webOrigin: homePath);
              },
            ),
          ],
        ),
      ),
    );
  }
}
