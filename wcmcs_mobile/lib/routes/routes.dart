import '../../wcmcs_exporter.dart';

///* this provides the default router delegate for the app
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: initialPath,
    restorationScopeId: wcmcsAppId,
    routes: [
      //* home page
      GoRoute(
        path: homePath,
        builder: (context, state) => const WcmcsHome(),
      ),

      //* auth
      GoRoute(
        path: authPath,
        builder: (context, state) => const WcmcsAuth(),
      ),

      //* user

      // * settings
      GoRoute(
        path: settingsPath,
        builder: (context, state) => const WcmcsSettings(),
      ),
    ],

    redirect: (_, state) {
      //TODO if the user is not logged in, redirect to the auth page

      //TODO if the user is logged in, don't redirect to any page just continue with the initial path
      return null;
    },
    errorBuilder: (context, state) => WcmcsErrorScreen(error: state.error),
    // log diagnostic info for your routes
    debugLogDiagnostics: true,
  );
});
