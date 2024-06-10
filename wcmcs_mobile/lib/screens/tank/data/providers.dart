// provers for the tank

import 'dart:math';

import '../../../app_exporter.dart';
import 'tank_type.dart';

/// type of tank
final selectedTankTypeProvider = StateProvider<TankType>((ref) {
  return TankType.empty();
});

/// circumference provider
final circumferenceProvider = StateProvider<num>((ref) {
  return 0;
});

///  radius provider, gets it from the circumference
final radiusProvider = StateProvider<num>((ref) {
  final circumference = ref.watch(circumferenceProvider);

  return circumference / (2 * pi);
});

/// height provider
final heightProvider = StateProvider<num>((ref) {
  return 0;
});

/// length provider
final lengthProvider = StateProvider<num>((ref) {
  return 0;
});

/// width provider
final widthProvider = StateProvider<num>((ref) {
  return 0;
});

/// reset providers function
void resetTankProviders(WidgetRef ref) {
  ref.read(selectedTankTypeProvider.notifier).state = TankType.empty();
  ref.read(circumferenceProvider.notifier).state = 0;
  ref.read(heightProvider.notifier).state = 0;
  ref.read(lengthProvider.notifier).state = 0;
  ref.read(widthProvider.notifier).state = 0;
}

///tnak form
final tankFormKeyProvider =
    Provider<GlobalKey<FormState>>((_) => GlobalKey<FormState>());

/// Tank provider
final tankProvider = Provider.autoDispose<Tank>((ref) {
  final tankType = ref.watch(selectedTankTypeProvider);
  final radius = ref.watch(radiusProvider);

  // app user
  final appUser = ref.watch(appUserProvider);

  final height = ref.watch(heightProvider);
  final length = ref.watch(lengthProvider);
  final width = ref.watch(widthProvider);

  //
  final tank = Tank(
    radius: radius,
    height: height,
    userId: appUser.userId,
    tankType: tankType.name.toLowerCase(),
    length: length,
    width: width,
  );

  // return the tank
  return tank;
});
