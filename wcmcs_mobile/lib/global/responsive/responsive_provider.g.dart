// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsive_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appResponsiveHash() => r'dc43abbff11807fb397955ab9e098617a12374b2';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [appResponsive].
@ProviderFor(appResponsive)
const appResponsiveProvider = AppResponsiveFamily();

/// See also [appResponsive].
class AppResponsiveFamily extends Family<AppResponsive> {
  /// See also [appResponsive].
  const AppResponsiveFamily();

  /// See also [appResponsive].
  AppResponsiveProvider call(
    BuildContext context,
  ) {
    return AppResponsiveProvider(
      context,
    );
  }

  @override
  AppResponsiveProvider getProviderOverride(
    covariant AppResponsiveProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'appResponsiveProvider';
}

/// See also [appResponsive].
class AppResponsiveProvider extends AutoDisposeProvider<AppResponsive> {
  /// See also [appResponsive].
  AppResponsiveProvider(
    BuildContext context,
  ) : this._internal(
          (ref) => appResponsive(
            ref as AppResponsiveRef,
            context,
          ),
          from: appResponsiveProvider,
          name: r'appResponsiveProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appResponsiveHash,
          dependencies: AppResponsiveFamily._dependencies,
          allTransitiveDependencies:
              AppResponsiveFamily._allTransitiveDependencies,
          context: context,
        );

  AppResponsiveProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Override overrideWith(
    AppResponsive Function(AppResponsiveRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AppResponsiveProvider._internal(
        (ref) => create(ref as AppResponsiveRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<AppResponsive> createElement() {
    return _AppResponsiveProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppResponsiveProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppResponsiveRef on AutoDisposeProviderRef<AppResponsive> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _AppResponsiveProviderElement
    extends AutoDisposeProviderElement<AppResponsive> with AppResponsiveRef {
  _AppResponsiveProviderElement(super.provider);

  @override
  BuildContext get context => (origin as AppResponsiveProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
