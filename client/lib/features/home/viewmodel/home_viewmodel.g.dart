// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllSongsHash() => r'700b9dd7148e6e756e3b0b519a7785fd0ac9fdab';

/// See also [getAllSongs].
@ProviderFor(getAllSongs)
final getAllSongsProvider = AutoDisposeFutureProvider<List<SongModel>>.internal(
  getAllSongs,
  name: r'getAllSongsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllSongsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllSongsRef = AutoDisposeFutureProviderRef<List<SongModel>>;
String _$homeViewmodelHash() => r'60ae9b6292558545d0708a6921a58d3846391bf1';

/// See also [HomeViewmodel].
@ProviderFor(HomeViewmodel)
final homeViewmodelProvider =
    AutoDisposeNotifierProvider<HomeViewmodel, AsyncValue?>.internal(
  HomeViewmodel.new,
  name: r'homeViewmodelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeViewmodelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeViewmodel = AutoDisposeNotifier<AsyncValue?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
