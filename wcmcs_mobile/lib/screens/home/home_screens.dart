import '../../app_exporter.dart';
import 'navbar/navbar_notifier.dart';
import 'pages/pages_data.dart';

/// This is the home screen body that will show the selected page
class HomeScreens extends ConsumerWidget {
  /// Constructor for the [HomeScreens]
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navBarIndex = ref.watch(selectedNavBarIndexProvider);

    /// home pages
    final homePages = ref.watch(homePagesProvider);

    final page = homePages.elementAt(navBarIndex);

    return PageTransitionSwitcher(
      transitionBuilder: (child, animation, secondaryAnimation) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          fillColor: appTransparent,
          child: child,
        );
      },
      duration: halfSeconds,
      child: page.screenWidget,
    );
  }
}
