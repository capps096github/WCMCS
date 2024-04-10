//
import 'package:flutter/cupertino.dart';

import '../../../wcmcs_exporter.dart';
import '../../intro/intro.dart';
import 'home_page.dart';

/// This provider checks if the current user is a Calcut Plus user and then returns the respective screens
///  and if they aint wcmcs plus, they will have Calcut Plus screen in there
final homePagesProvider = StateProvider<List<HomePage>>((ref) {
  return [
    /// saved
    HomePage(
      label: 'Home',
      tooltip: 'Home',
      selectedIcon: CupertinoIcons.house_fill,
      unselectedIcon: CupertinoIcons.house,
      screenWidget: const IntroScreen(),
      routePath: '/intro',
    ),

    /// home
    HomePage(
      label: 'Water Usage',
      tooltip: 'Water',
      screenWidget: const AppPlaceholder(
        title: 'Tips',
      ),
      routePath: homePath,
    ),

    /// courses
    HomePage(
      label: 'Tips',
      tooltip: 'Water Usage Tips',
      selectedIcon: CupertinoIcons.layers_alt_fill,
      unselectedIcon: CupertinoIcons.layers_alt,
      screenWidget: const AppPlaceholder(
        title: 'Tips',
      ),
      routePath: tipsPath,
    ),
  ];
});
