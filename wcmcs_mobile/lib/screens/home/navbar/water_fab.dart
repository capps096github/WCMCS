
import '../../../wcmcs_exporter.dart';
import 'navbar_notifier.dart';

/// this is the floating action button for the calculate screen
class WaterFAB extends ConsumerWidget {
  /// [WaterFAB] constructor
  const WaterFAB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navBarIndex = ref.watch(selectedNavBarIndexProvider);

    /// check if we are on the Calculate screen
    final isSelected = (navBarIndex == 1);

    // colrs
    const backgroundColor = wcmcsColor;
    final foregroundColor =
        isSelected ? wcmcsWhite : wcmcsWhite.withOpacity(.6);

    return FloatingActionButton(
      elevation: 0,
      backgroundColor: backgroundColor,
      shape: CircleBorder(
        side: BorderSide(
          color: wcmcsColor.withOpacity(.1),
        ),
      ),
      onPressed: isSelected
          ? null
          : () {
              ///[Notify Listeners]
              ref.read(selectedNavBarIndexProvider.notifier).state = 1;
            },
      child: AppLogo(logoSize: 24, logoColor: foregroundColor),
    );
  }
}
