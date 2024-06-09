// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appUserStreamHash() => r'7e144fb8027e6ae6fed839e35cdcfbde073f9483';

/// currenty logggen in user streamProvider
///
/// Copied from [appUserStream].
@ProviderFor(appUserStream)
final appUserStreamProvider =
    AutoDisposeStreamProvider<DocumentSnapshot<AppUser>>.internal(
  appUserStream,
  name: r'appUserStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appUserStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppUserStreamRef
    = AutoDisposeStreamProviderRef<DocumentSnapshot<AppUser>>;
String _$appUserHash() => r'69bbb055c4b67ddc27cc0cefc6b4f0ab617b7a54';

/// returns the current user
///
/// Copied from [appUser].
@ProviderFor(appUser)
final appUserProvider = AutoDisposeProvider<AppUser>.internal(
  appUser,
  name: r'appUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppUserRef = AutoDisposeProviderRef<AppUser>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
