part of 'my_property_list_bloc.dart';

@freezed
class MyPropertyListEvent with _$MyPropertyListEvent {
  const factory MyPropertyListEvent.fetchProperties({
    String? search,
    FilterOptions? filterOptions,
    String? priceRange,
    List<String>? category,
    int? rating,
  }) = _FetchProperties;

  const factory MyPropertyListEvent.fetchNearbyProperties() =
      _FetchNearbyProperties;

  const factory MyPropertyListEvent.clear() = _Clear;
}
