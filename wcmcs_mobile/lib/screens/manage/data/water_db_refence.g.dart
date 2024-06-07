// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_db_refence.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sectionStreamHash() => r'a29f8c992445d66a0d627dcb949c7c2e44519b47';

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

/// this gets us the stream of sections
///
/// Copied from [sectionStream].
@ProviderFor(sectionStream)
const sectionStreamProvider = SectionStreamFamily();

/// this gets us the stream of sections
///
/// Copied from [sectionStream].
class SectionStreamFamily
    extends Family<AsyncValue<DocumentSnapshot<Map<String, dynamic>>>> {
  /// this gets us the stream of sections
  ///
  /// Copied from [sectionStream].
  const SectionStreamFamily();

  /// this gets us the stream of sections
  ///
  /// Copied from [sectionStream].
  SectionStreamProvider call({
    required String collection,
  }) {
    return SectionStreamProvider(
      collection: collection,
    );
  }

  @override
  SectionStreamProvider getProviderOverride(
    covariant SectionStreamProvider provider,
  ) {
    return call(
      collection: provider.collection,
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
  String? get name => r'sectionStreamProvider';
}

/// this gets us the stream of sections
///
/// Copied from [sectionStream].
class SectionStreamProvider
    extends StreamProvider<DocumentSnapshot<Map<String, dynamic>>> {
  /// this gets us the stream of sections
  ///
  /// Copied from [sectionStream].
  SectionStreamProvider({
    required String collection,
  }) : this._internal(
          (ref) => sectionStream(
            ref as SectionStreamRef,
            collection: collection,
          ),
          from: sectionStreamProvider,
          name: r'sectionStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sectionStreamHash,
          dependencies: SectionStreamFamily._dependencies,
          allTransitiveDependencies:
              SectionStreamFamily._allTransitiveDependencies,
          collection: collection,
        );

  SectionStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collection,
  }) : super.internal();

  final String collection;

  @override
  Override overrideWith(
    Stream<DocumentSnapshot<Map<String, dynamic>>> Function(
            SectionStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SectionStreamProvider._internal(
        (ref) => create(ref as SectionStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collection: collection,
      ),
    );
  }

  @override
  StreamProviderElement<DocumentSnapshot<Map<String, dynamic>>>
      createElement() {
    return _SectionStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SectionStreamProvider && other.collection == collection;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collection.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SectionStreamRef
    on StreamProviderRef<DocumentSnapshot<Map<String, dynamic>>> {
  /// The parameter `collection` of this provider.
  String get collection;
}

class _SectionStreamProviderElement
    extends StreamProviderElement<DocumentSnapshot<Map<String, dynamic>>>
    with SectionStreamRef {
  _SectionStreamProviderElement(super.provider);

  @override
  String get collection => (origin as SectionStreamProvider).collection;
}

String _$dailyWaterFlowStreamHash() =>
    r'5fc5c67c724a84321bf41df480cdf5cb3196cb4d';

/// this returns the water flow stream of a given date
///
/// Copied from [dailyWaterFlowStream].
@ProviderFor(dailyWaterFlowStream)
const dailyWaterFlowStreamProvider = DailyWaterFlowStreamFamily();

/// this returns the water flow stream of a given date
///
/// Copied from [dailyWaterFlowStream].
class DailyWaterFlowStreamFamily extends Family<AsyncValue<List<WaterFlow>>> {
  /// this returns the water flow stream of a given date
  ///
  /// Copied from [dailyWaterFlowStream].
  const DailyWaterFlowStreamFamily();

  /// this returns the water flow stream of a given date
  ///
  /// Copied from [dailyWaterFlowStream].
  DailyWaterFlowStreamProvider call({
    required String collection,
  }) {
    return DailyWaterFlowStreamProvider(
      collection: collection,
    );
  }

  @override
  DailyWaterFlowStreamProvider getProviderOverride(
    covariant DailyWaterFlowStreamProvider provider,
  ) {
    return call(
      collection: provider.collection,
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
  String? get name => r'dailyWaterFlowStreamProvider';
}

/// this returns the water flow stream of a given date
///
/// Copied from [dailyWaterFlowStream].
class DailyWaterFlowStreamProvider
    extends AutoDisposeStreamProvider<List<WaterFlow>> {
  /// this returns the water flow stream of a given date
  ///
  /// Copied from [dailyWaterFlowStream].
  DailyWaterFlowStreamProvider({
    required String collection,
  }) : this._internal(
          (ref) => dailyWaterFlowStream(
            ref as DailyWaterFlowStreamRef,
            collection: collection,
          ),
          from: dailyWaterFlowStreamProvider,
          name: r'dailyWaterFlowStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dailyWaterFlowStreamHash,
          dependencies: DailyWaterFlowStreamFamily._dependencies,
          allTransitiveDependencies:
              DailyWaterFlowStreamFamily._allTransitiveDependencies,
          collection: collection,
        );

  DailyWaterFlowStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collection,
  }) : super.internal();

  final String collection;

  @override
  Override overrideWith(
    Stream<List<WaterFlow>> Function(DailyWaterFlowStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DailyWaterFlowStreamProvider._internal(
        (ref) => create(ref as DailyWaterFlowStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collection: collection,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<WaterFlow>> createElement() {
    return _DailyWaterFlowStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DailyWaterFlowStreamProvider &&
        other.collection == collection;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collection.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DailyWaterFlowStreamRef on AutoDisposeStreamProviderRef<List<WaterFlow>> {
  /// The parameter `collection` of this provider.
  String get collection;
}

class _DailyWaterFlowStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<WaterFlow>>
    with DailyWaterFlowStreamRef {
  _DailyWaterFlowStreamProviderElement(super.provider);

  @override
  String get collection => (origin as DailyWaterFlowStreamProvider).collection;
}

String _$sectionsHash() => r'b3197a02037d5825229416d17d4524738e5258e2';

/// read sections
///
/// Copied from [sections].
@ProviderFor(sections)
final sectionsProvider = AutoDisposeStreamProvider<List<Section>>.internal(
  sections,
  name: r'sectionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sectionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SectionsRef = AutoDisposeStreamProviderRef<List<Section>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
