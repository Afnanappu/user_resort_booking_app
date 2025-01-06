part of 'property_details_home_bloc.dart';

@freezed
class PropertyDetailsHomeState with _$PropertyDetailsHomeState {
  const factory PropertyDetailsHomeState.initial() = _Initial;
  const factory PropertyDetailsHomeState.loading() = _Loading;
  const factory PropertyDetailsHomeState.loaded(
      PropertyDetailsModel propertyDetails) = _Loaded;
  const factory PropertyDetailsHomeState.error(String message) = _Error;
}
