import '../../app_exporter.dart';

/// This is the body of the authentication screen
class AuthBody extends ConsumerWidget {
  /// [AuthBody] constructor
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding:
          const EdgeInsets.symmetric(horizontal: spacing16, vertical: spacing8),
      decoration: const BoxDecoration(
        color: appBackground,
        borderRadius: BorderRadius.only(
          topLeft: circularRadius16,
          topRight: circularRadius16,
        ),
      ),
      child: const BodyWidth(
        maxWidth: maxAuthWidth,
        body: AuthBodyPages(),
      ),
    );
  }
}

/// This is the body of the authentication screen
class AuthBodyPages extends ConsumerWidget {
  /// [AuthBodyPages] constructor
  const AuthBodyPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authpageIndex = ref.watch(authPageIndexProvider);

    /// check if we are on mobile
    final isMobile = ref.watch(appResponsiveProvider(context)).isMobileScreen;

    //
    return PageTransitionSwitcher(
      transitionBuilder: (child, animation, secondaryAnimation) {
        /// return FadeThroughTransition(
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          fillColor: appTransparent,
          transitionType: isMobile
              ? SharedAxisTransitionType.scaled
              : SharedAxisTransitionType.horizontal,
          child: child,
        );
      },
      duration: halfSeconds,
      child: authPages[authpageIndex],
    );
  }
}
