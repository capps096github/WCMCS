import '../../wcmcs_exporter.dart';

class WcmcsErrorScreen extends StatelessWidget {
  const WcmcsErrorScreen({
    required this.error, super.key,
    });

  // error object
  final Exception? error;

  @override
  Widget build(BuildContext context) {
     // TODO: beautify this error screen
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(error.toString()),
            TextButton(
              onPressed: () => context.go(homePath),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}