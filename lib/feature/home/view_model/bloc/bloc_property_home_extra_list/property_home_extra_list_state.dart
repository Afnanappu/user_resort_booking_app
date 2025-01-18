part of 'property_home_extra_list_bloc.dart';

@freezed
class PropertyHomeExtraListState with _$PropertyHomeExtraListState {
  const factory PropertyHomeExtraListState.initial() = _Initial;
  const factory PropertyHomeExtraListState.loading() = _Loading;
  const factory PropertyHomeExtraListState.loaded(
      List<PropertyCardModel> propertyList) = _Loaded;
  const factory PropertyHomeExtraListState.error(String message) = _Error;
}
