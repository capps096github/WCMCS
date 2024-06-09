// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appUserStreamHash() => r'600bb406c3aa5fba1e9817a414122616ae332531';

/// currenty logggen in user streamProvider
///
/// Copied from [appUserStream].
@ProviderFor(appUserStream)
final appUserStreamProvider =
    StreamProvider<DocumentSnapshot<AppUser>>.internal(
  appUserStream,
  name: r'appUserStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appUserStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppUserStreamRef = StreamProviderRef<DocumentSnapshot<AppUser>>;
String _$appUserHash() => r'3aaa53533590dae5f0f1752de3c7d5a471190256';

/// returns the current user
///
/// Copied from [appUser].
@ProviderFor(appUser)
final appUserProvider = Provider<AppUser>.internal(
  appUser,
  name: r'appUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppUserRef = ProviderRef<AppUser>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
