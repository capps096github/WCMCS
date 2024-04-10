import '../../global/functions/sample_future.dart';
import '../../wcmcs_exporter.dart';
import 'home_screens.dart';
import 'navbar/water_fab.dart';
import 'navbar/navbar.dart';

/// home page of the WCMS app
class WcmcsHome extends ConsumerWidget {
  /// [WcmcsHome] constructor
  const WcmcsHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = ref.watch(sampleFutureProvider);

    /// * Listen to the user stream so that the app user updates automatically
    return userStream.when(
      loading: () => const WcmcsSplash(),
      error: (error, stackTrace) => ErrorDisplay(
        error: error,
        stackTrace: stackTrace,
      ),
      data: (_) => const AppHomeBody(),
    );
  }
}

/// Home body of the WCMS app
class AppHomeBody extends StatelessWidget {
  /// [AppHomeBody] constructor
  const AppHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wcmcsBackground,
      appBar: AppBar(
        backgroundColor: wcmcsBackground,
        scrolledUnderElevation: 0,
        title: const Hero(
          tag: 'appLogo',
          child: AppLogo(
            logoSize: 30,
          ),
        ),
      ),
      body: const ColoredBox(
        color: wcmcsBackground,
        child: HomeScreens(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const WaterFAB(),
      bottomNavigationBar: const HomeNavbar(),
    );
  }
}
