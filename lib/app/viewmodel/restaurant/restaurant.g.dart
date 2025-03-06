// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getRestaurantNotifierHash() =>
    r'3a44cc145026e7173289c47edbaf75bb36218aa2';

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

abstract class _$GetRestaurantNotifier extends BuildlessAsyncNotifier<Object?> {
  late final int table;

  FutureOr<Object?> build(
    int table,
  );
}

/// See also [GetRestaurantNotifier].
@ProviderFor(GetRestaurantNotifier)
const getRestaurantNotifierProvider = GetRestaurantNotifierFamily();

/// See also [GetRestaurantNotifier].
class GetRestaurantNotifierFamily extends Family<AsyncValue> {
  /// See also [GetRestaurantNotifier].
  const GetRestaurantNotifierFamily();

  /// See also [GetRestaurantNotifier].
  GetRestaurantNotifierProvider call(
    int table,
  ) {
    return GetRestaurantNotifierProvider(
      table,
    );
  }

  @override
  GetRestaurantNotifierProvider getProviderOverride(
    covariant GetRestaurantNotifierProvider provider,
  ) {
    return call(
      provider.table,
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
  String? get name => r'getRestaurantNotifierProvider';
}

/// See also [GetRestaurantNotifier].
class GetRestaurantNotifierProvider
    extends AsyncNotifierProviderImpl<GetRestaurantNotifier, Object?> {
  /// See also [GetRestaurantNotifier].
  GetRestaurantNotifierProvider(
    int table,
  ) : this._internal(
          () => GetRestaurantNotifier()..table = table,
          from: getRestaurantNotifierProvider,
          name: r'getRestaurantNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getRestaurantNotifierHash,
          dependencies: GetRestaurantNotifierFamily._dependencies,
          allTransitiveDependencies:
              GetRestaurantNotifierFamily._allTransitiveDependencies,
          table: table,
        );

  GetRestaurantNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.table,
  }) : super.internal();

  final int table;

  @override
  FutureOr<Object?> runNotifierBuild(
    covariant GetRestaurantNotifier notifier,
  ) {
    return notifier.build(
      table,
    );
  }

  @override
  Override overrideWith(GetRestaurantNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: GetRestaurantNotifierProvider._internal(
        () => create()..table = table,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        table: table,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<GetRestaurantNotifier, Object?> createElement() {
    return _GetRestaurantNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetRestaurantNotifierProvider && other.table == table;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, table.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetRestaurantNotifierRef on AsyncNotifierProviderRef<Object?> {
  /// The parameter `table` of this provider.
  int get table;
}

class _GetRestaurantNotifierProviderElement
    extends AsyncNotifierProviderElement<GetRestaurantNotifier, Object?>
    with GetRestaurantNotifierRef {
  _GetRestaurantNotifierProviderElement(super.provider);

  @override
  int get table => (origin as GetRestaurantNotifierProvider).table;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
