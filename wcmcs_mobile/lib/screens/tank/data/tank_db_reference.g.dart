// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tank_db_reference.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tankStreamHash() => r'ea5d87e6d4c81a6654f11e51f9112904314e86a5';

/// this gets us the stream of sections
///
/// Copied from [tankStream].
@ProviderFor(tankStream)
final tankStreamProvider = StreamProvider<DocumentSnapshot<Tank>>.internal(
  tankStream,
  name: r'tankStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tankStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TankStreamRef = StreamProviderRef<DocumentSnapshot<Tank>>;
String _$userTankHash() => r'2aa2a3f7922fbaebd8b223f46e1f5b1a56af2e0e';

/// returns the current user
///
/// Copied from [userTank].
@ProviderFor(userTank)
final userTankProvider = Provider<Tank>.internal(
  userTank,
  name: r'userTankProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userTankHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserTankRef = ProviderRef<Tank>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
