import '../wcmcs_exporter.dart';

/// Splash Screen for the app
class WcmcsSplash extends StatelessWidget {
  /// [WcmcsSplash] constructor
  const WcmcsSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Hero(
          tag: 'appLogo',
          child: AppLogo(
            logoSize: 100,
          ),
        ),
      ),
    );
  }
}
