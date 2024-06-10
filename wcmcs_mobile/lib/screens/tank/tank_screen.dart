import '../../app_exporter.dart';
import 'add_tank/add_tank_card.dart';
import 'tank_body.dart';

/// this shows the amount of water in the tanks
class TankScreen extends ConsumerWidget {
  /// [TankScreen ] constructor
  const TankScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// listen to the user stream
    final tankStream = ref.watch(tankStreamProvider);

    //
    return Scaffold(
      appBar: AppBar(
        foregroundColor: appColor,
        backgroundColor: appWhite,
        scrolledUnderElevation: 0,
        title: const AppLogo(),
      ),
      body: SafeArea(
        child: Padding(
          padding: padding8,
          child: tankStream.when(
            loading: () => const Scaffold(body: EmptySection(color: appColor)),
            error: (error, stackTrace) => ErrorDisplay(
              error: error,
              stackTrace: stackTrace,
            ),
            data: (snapshot) {
              // check if the snapshot is empty
              if (snapshot.exists) {
                return TankBody(tank: Tank.fromSnapshot(snapshot));
              } else {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoldTileWithDescription(
                      textAlign: TextAlign.left,
                      boldTitle: BoldTitle(
                        textAlign: TextAlign.left,
                        text: 'No Tank Found',
                        color: appColor,
                        fontSize: 25,
                      ),
                      descFontSize: 14,
                      description:
                          'Enter the details of your tank to get started with the tank measurements',
                    ),
                    Spacing(of: spacing32),
                    AddTankCard(),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
