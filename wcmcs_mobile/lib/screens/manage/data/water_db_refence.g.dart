// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_db_refence.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$waterFlowStreamHash() => r'c0840508a9ea7be7df7897c13c2a21e246f3a0b6';

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

/// returns a query snapshot
/// and also if possible takes in a date
///
/// Copied from [waterFlowStream].
@ProviderFor(waterFlowStream)
const waterFlowStreamProvider = WaterFlowStreamFamily();

/// returns a query snapshot
/// and also if possible takes in a date
///
/// Copied from [waterFlowStream].
class WaterFlowStreamFamily
    extends Family<AsyncValue<QuerySnapshot<WaterFlow>>> {
  /// returns a query snapshot
  /// and also if possible takes in a date
  ///
  /// Copied from [waterFlowStream].
  const WaterFlowStreamFamily();

  /// returns a query snapshot
  /// and also if possible takes in a date
  ///
  /// Copied from [waterFlowStream].
  WaterFlowStreamProvider call({
    required String collection,
  }) {
    return WaterFlowStreamProvider(
      collection: collection,
    );
  }

  @override
  WaterFlowStreamProvider getProviderOverride(
    covariant WaterFlowStreamProvider provider,
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
  String? get name => r'waterFlowStreamProvider';
}

/// returns a query snapshot
/// and also if possible takes in a date
///
/// Copied from [waterFlowStream].
class WaterFlowStreamProvider extends StreamProvider<QuerySnapshot<WaterFlow>> {
  /// returns a query snapshot
  /// and also if possible takes in a date
  ///
  /// Copied from [waterFlowStream].
  WaterFlowStreamProvider({
    required String collection,
  }) : this._internal(
          (ref) => waterFlowStream(
            ref as WaterFlowStreamRef,
            collection: collection,
          ),
          from: waterFlowStreamProvider,
          name: r'waterFlowStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$waterFlowStreamHash,
          dependencies: WaterFlowStreamFamily._dependencies,
          allTransitiveDependencies:
              WaterFlowStreamFamily._allTransitiveDependencies,
          collection: collection,
        );

  WaterFlowStreamProvider._internal(
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
    Stream<QuerySnapshot<WaterFlow>> Function(WaterFlowStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WaterFlowStreamProvider._internal(
        (ref) => create(ref as WaterFlowStreamRef),
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
  StreamProviderElement<QuerySnapshot<WaterFlow>> createElement() {
    return _WaterFlowStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WaterFlowStreamProvider && other.collection == collection;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collection.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WaterFlowStreamRef on StreamProviderRef<QuerySnapshot<WaterFlow>> {
  /// The parameter `collection` of this provider.
  String get collection;
}

class _WaterFlowStreamProviderElement
    extends StreamProviderElement<QuerySnapshot<WaterFlow>>
    with WaterFlowStreamRef {
  _WaterFlowStreamProviderElement(super.provider);

  @override
  String get collection => (origin as WaterFlowStreamProvider).collection;
}

String _$dashDateHash() => r'a15f586380050f5a049605e7025ada88f2ddc9b7';

/// this returns the date in dashed format of 3-4-2024
///
/// Copied from [dashDate].
@ProviderFor(dashDate)
const dashDateProvider = DashDateFamily();

/// this returns the date in dashed format of 3-4-2024
///
/// Copied from [dashDate].
class DashDateFamily extends Family<String> {
  /// this returns the date in dashed format of 3-4-2024
  ///
  /// Copied from [dashDate].
  const DashDateFamily();

  /// this returns the date in dashed format of 3-4-2024
  ///
  /// Copied from [dashDate].
  DashDateProvider call({
    DateTime? dateTime,
  }) {
    return DashDateProvider(
      dateTime: dateTime,
    );
  }

  @override
  DashDateProvider getProviderOverride(
    covariant DashDateProvider provider,
  ) {
    return call(
      dateTime: provider.dateTime,
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
  String? get name => r'dashDateProvider';
}

/// this returns the date in dashed format of 3-4-2024
///
/// Copied from [dashDate].
class DashDateProvider extends Provider<String> {
  /// this returns the date in dashed format of 3-4-2024
  ///
  /// Copied from [dashDate].
  DashDateProvider({
    DateTime? dateTime,
  }) : this._internal(
          (ref) => dashDate(
            ref as DashDateRef,
            dateTime: dateTime,
          ),
          from: dashDateProvider,
          name: r'dashDateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dashDateHash,
          dependencies: DashDateFamily._dependencies,
          allTransitiveDependencies: DashDateFamily._allTransitiveDependencies,
          dateTime: dateTime,
        );

  DashDateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dateTime,
  }) : super.internal();

  final DateTime? dateTime;

  @override
  Override overrideWith(
    String Function(DashDateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DashDateProvider._internal(
        (ref) => create(ref as DashDateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dateTime: dateTime,
      ),
    );
  }

  @override
  ProviderElement<String> createElement() {
    return _DashDateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DashDateProvider && other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dateTime.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DashDateRef on ProviderRef<String> {
  /// The parameter `dateTime` of this provider.
  DateTime? get dateTime;
}

class _DashDateProviderElement extends ProviderElement<String>
    with DashDateRef {
  _DashDateProviderElement(super.provider);

  @override
  DateTime? get dateTime => (origin as DashDateProvider).dateTime;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
