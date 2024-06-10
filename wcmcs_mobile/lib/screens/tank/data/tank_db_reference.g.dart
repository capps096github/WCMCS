// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tank_db_reference.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tankStreamHash() => r'2d731f6c2f0253c4901448a71962a82e5ed1ae2e';

/// this gets us the stream of sections
///
/// Copied from [tankStream].
@ProviderFor(tankStream)
final tankStreamProvider =
    AutoDisposeStreamProvider<DocumentSnapshot<Tank>>.internal(
  tankStream,
  name: r'tankStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tankStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TankStreamRef = AutoDisposeStreamProviderRef<DocumentSnapshot<Tank>>;
String _$userTankHash() => r'b923f84fcb975cf407fe2115a406fe3fa2a3c410';

/// returns the current user
///
/// Copied from [userTank].
@ProviderFor(userTank)
final userTankProvider = AutoDisposeProvider<Tank>.internal(
  userTank,
  name: r'userTankProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userTankHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserTankRef = AutoDisposeProviderRef<Tank>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
