part of 'property_home_room_list_bloc.dart';

@freezed
class PropertyHomeRoomListState with _$PropertyHomeRoomListState {
  const factory PropertyHomeRoomListState.initial() = _Initial;
  const factory PropertyHomeRoomListState.loading() = _Loading;
  const factory PropertyHomeRoomListState.loaded(List<RoomModel> roomList) =
      _Loaded;
  const factory PropertyHomeRoomListState.error(String message) = _Error;
}
