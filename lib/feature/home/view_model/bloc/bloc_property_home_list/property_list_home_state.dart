part of 'property_list_home_bloc.dart';

@freezed
class PropertyListHomeState with _$PropertyListHomeState {
  const factory PropertyListHomeState.initial() = _Initial;
  const factory PropertyListHomeState.loading() = _Loading;
  const factory PropertyListHomeState.loaded(
      List<PropertyCardModel> propertyList) = _Loaded;
  const factory PropertyListHomeState.error(String message) = _Error;
}
