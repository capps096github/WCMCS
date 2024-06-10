import '../../app_exporter.dart';
import 'app_home.dart';


/// home page of the WCMS app
class WcmcsHome extends ConsumerWidget {
  /// [WcmcsHome] constructor
  const WcmcsHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = ref.watch(appUserStreamProvider);

    /// * Listen to the user stream so that the app user updates automatically
    return userStream.when(
      loading: () => const Scaffold(body: EmptySection(color: appColor)),
      error: (error, stackTrace) => ErrorDisplay(
        error: error,
        stackTrace: stackTrace,
      ),
      data: (_) => const AppHomeBody(),
    );
  }
}

/// Home body of the WCMS app
class AppHomeBody extends ConsumerWidget {
  /// [AppHomeBody] constructor
  const AppHomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// responsiveness
    final calcutResponsive = ref.watch(appResponsiveProvider(context));

    final isMobile = calcutResponsive.isMobileScreen;

    return Scaffold(
      backgroundColor: appBackground,
      appBar: AppBar(
        backgroundColor: appBackground,
        scrolledUnderElevation: 0,
        leading: isMobile ? const UserProfilePic() : null,
        title: const Hero(
          tag: 'appLogo',
          child: AppLogo(
            logoSize: 30,
          ),
        ),
      ),
      body: const ColoredBox(
        color: appBackground,
        child: AppHome(),
      ),
    );
  }
}
