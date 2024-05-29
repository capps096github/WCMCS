import '../app_exporter.dart';

/// this is where the app starts
class MainApp extends ConsumerWidget {
  ///This is the root of our wcmcs app
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    final wcmcsTheme = ref.watch(wcmcsThemeProvider);

    return MaterialApp.router(
      // -- Router --
      routerConfig: goRouter,

      // -- Theme --
      color: appColor,
      theme: wcmcsTheme,

      // -- Title --
      title: wcmcsTitle,
      restorationScopeId: wcmcsAppId,

      // -- Debug Mode --
      debugShowCheckedModeBanner: false,

      // -- Bouncing Scroll Behavior --
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
        scrollbars: false,
      ),
    );
  }
}
