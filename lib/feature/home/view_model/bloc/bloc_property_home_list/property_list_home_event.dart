part of 'property_list_home_bloc.dart';

@freezed
class PropertyListHomeEvent with _$PropertyListHomeEvent {
  const factory PropertyListHomeEvent.fetchProperties() = _FetchProperties;
}
