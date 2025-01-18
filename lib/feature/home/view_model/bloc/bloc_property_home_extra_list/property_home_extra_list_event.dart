part of 'property_home_extra_list_bloc.dart';

@freezed
class PropertyHomeExtraListEvent with _$PropertyHomeExtraListEvent {
  const factory PropertyHomeExtraListEvent.fetchProperties(
      {required String type}) = _FetchProperties;
}
