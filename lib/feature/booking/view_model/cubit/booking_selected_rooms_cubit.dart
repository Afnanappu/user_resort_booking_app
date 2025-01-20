import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_resort_booking_app/core/data/models/room_model.dart';

class BookingSelectedRoomsCubit extends Cubit<List<RoomModel>> {
  BookingSelectedRoomsCubit() : super([]);

  void setRooms(List<RoomModel> roomModelList) {
    emit(roomModelList);
  }

  void toggleRoom(RoomModel room) {
    if (state.contains(room)) {
      emit(state.where((r) => r != room).toList());
      log('Room is removed');
    } else {
      emit([...state, room]);
      log('Room is added');
    }
    log(state.length.toString());
  }

  bool isRoomSelected(RoomModel room) {
    return state.contains(room);
  }

  void clear() {
    emit([]);
  }
}
