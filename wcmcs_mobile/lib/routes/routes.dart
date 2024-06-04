import '../app_exporter.dart';

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
        builder: (context, state) => const AuthScreen(),
      ),

      // * tips
      GoRoute(
        path: tipsPath,
        builder: (context, state) => const TipsScreen(),
      ),

      // * manage
      GoRoute(
        path: managePath,
        builder: (context, state) => const ManageScreen(),
      ),

      //* user
      GoRoute(
        path: userProfilePath,
        builder: (context, state) => const UserProfile(),
      ),

      // * settings
      GoRoute(
        path: settingsPath,
        builder: (context, state) => const AppSettings(),
      ),
    ],

    redirect: (_, state) {
     //! ** this app user is repeated here, and therefore don't delete it
        final appUser = FirebaseAuth.instance.currentUser;

        // set the user logged in variable
        final loggedIn = (appUser != null);

        /// is authenticating
        final isAuthenticating = (state.matchedLocation == authPath);

        /// if the user is on the auth Screen or Welcome screen which also has the auth UI
        final loggingIn = isAuthenticating;

        /// if the user is not logged in, then ...
        if (!loggedIn) {
          /// if user is on auth or welcome page then we redirect to the welcome page
          /// else don't redirect to any page since the user is on the login page
          return loggingIn ? null : authPath;
        }

        /// if the user is logged in but still on the login page, send them to
        /// the home page
        if (loggingIn) return homePath;

        /// no need to redirect at all
        return null;
    },
    onException: (context, state, _) => ErrorDisplay(
      error: state.error.toString(),
      stackTrace: StackTrace.current,
    ), // log diagnostic info for your routes
    debugLogDiagnostics: true,
  );
});
