// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dishes.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDishesNotifierHash() => r'280f67a363636eac685f0ce0e0a254bc051229eb';

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

abstract class _$GetDishesNotifier extends BuildlessAsyncNotifier<Object?> {
  late final dynamic category;

  FutureOr<Object?> build(
    dynamic category,
  );
}

/// See also [GetDishesNotifier].
@ProviderFor(GetDishesNotifier)
const getDishesNotifierProvider = GetDishesNotifierFamily();

/// See also [GetDishesNotifier].
class GetDishesNotifierFamily extends Family<AsyncValue> {
  /// See also [GetDishesNotifier].
  const GetDishesNotifierFamily();

  /// See also [GetDishesNotifier].
  GetDishesNotifierProvider call(
    dynamic category,
  ) {
    return GetDishesNotifierProvider(
      category,
    );
  }

  @override
  GetDishesNotifierProvider getProviderOverride(
    covariant GetDishesNotifierProvider provider,
  ) {
    return call(
      provider.category,
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
  String? get name => r'getDishesNotifierProvider';
}

/// See also [GetDishesNotifier].
class GetDishesNotifierProvider
    extends AsyncNotifierProviderImpl<GetDishesNotifier, Object?> {
  /// See also [GetDishesNotifier].
  GetDishesNotifierProvider(
    dynamic category,
  ) : this._internal(
          () => GetDishesNotifier()..category = category,
          from: getDishesNotifierProvider,
          name: r'getDishesNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDishesNotifierHash,
          dependencies: GetDishesNotifierFamily._dependencies,
          allTransitiveDependencies:
              GetDishesNotifierFamily._allTransitiveDependencies,
          category: category,
        );

  GetDishesNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final dynamic category;

  @override
  FutureOr<Object?> runNotifierBuild(
    covariant GetDishesNotifier notifier,
  ) {
    return notifier.build(
      category,
    );
  }

  @override
  Override overrideWith(GetDishesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: GetDishesNotifierProvider._internal(
        () => create()..category = category,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<GetDishesNotifier, Object?> createElement() {
    return _GetDishesNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDishesNotifierProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetDishesNotifierRef on AsyncNotifierProviderRef<Object?> {
  /// The parameter `category` of this provider.
  dynamic get category;
}

class _GetDishesNotifierProviderElement
    extends AsyncNotifierProviderElement<GetDishesNotifier, Object?>
    with GetDishesNotifierRef {
  _GetDishesNotifierProviderElement(super.provider);

  @override
  dynamic get category => (origin as GetDishesNotifierProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
