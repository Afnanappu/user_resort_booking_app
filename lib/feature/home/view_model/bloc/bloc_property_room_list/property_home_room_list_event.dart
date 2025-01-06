part of 'property_home_room_list_bloc.dart';

@freezed
class PropertyHomeRoomListEvent with _$PropertyHomeRoomListEvent {
  const factory PropertyHomeRoomListEvent.fetchRooms(
      {required String propertyId}) = _FetchRooms;
}
