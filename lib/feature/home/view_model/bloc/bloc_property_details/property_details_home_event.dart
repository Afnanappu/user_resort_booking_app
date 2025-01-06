part of 'property_details_home_bloc.dart';

@freezed
class PropertyDetailsHomeEvent with _$PropertyDetailsHomeEvent {
  const factory PropertyDetailsHomeEvent.fetchPropertyDetails(
      {required String id}) = _FetchPropertyDetails;
}
