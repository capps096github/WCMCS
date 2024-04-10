import '../wcmcs_exporter.dart';

class Wcmcs extends ConsumerWidget {
  ///This is the root of our wcmcs app
  const Wcmcs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    final wcmcsTheme = ref.watch(wcmcsThemeProvider);

    return MaterialApp.router(
      // -- Router --
      routerConfig: goRouter,

      // -- Theme --
      color: wcmcsColor,
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
