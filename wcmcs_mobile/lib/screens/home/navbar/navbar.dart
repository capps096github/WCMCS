/// Project imports:
library;

import '../../../wcmcs_exporter.dart';
import '../pages/pages_data.dart';
import 'navbar_icon.dart';
import 'navbar_notifier.dart';

/// This is the navbar of the home page
class HomeNavbar extends ConsumerWidget {
  /// [HomeNavbar] constructor
  const HomeNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navBarIndex = ref.watch(selectedNavBarIndexProvider);

    /// home pages
    final homePages = ref.watch(homePagesProvider);

    // saved results page
    final welcomePage = homePages.elementAt(0);

    // courses page
    final tipsPage = homePages.elementAt(2);

    return BottomAppBar(
      height: kNavbarHeight,
      color: wcmcsColor,
      clipBehavior: Clip.antiAlias,
      shape: const CircularNotchedRectangle(),
      padding: const EdgeInsets.symmetric(
        vertical: spacing8,
        horizontal: spacing16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(),
          NavbarIcon(
            label: welcomePage.label,
            tooltip: welcomePage.tooltip,
            selectedIcon: welcomePage.selectedIcon,
            unselectedIcon: welcomePage.unselectedIcon,
            isSelected: navBarIndex == 0,
            onPressed: () {
              ///[Notify Listeners]
              ref.read(selectedNavBarIndexProvider.notifier).state = 0;
            },
          ),
          const Spacer(flex: 4),
          NavbarIcon(
            label: tipsPage.label,
            tooltip: tipsPage.tooltip,
            selectedIcon: tipsPage.selectedIcon,
            unselectedIcon: tipsPage.unselectedIcon,
            isSelected: navBarIndex == 2,
            onPressed: () {
              ///[Notify Listeners]
              ref.read(selectedNavBarIndexProvider.notifier).state = 2;
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
