import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_resort_booking_app/core/models/room_model.dart';
import 'package:user_resort_booking_app/feature/home/repository/property_home_repository.dart';

part 'property_home_room_list_event.dart';
part 'property_home_room_list_state.dart';

part 'property_home_room_list_bloc.freezed.dart';

class PropertyHomeRoomListBloc
    extends Bloc<PropertyHomeRoomListEvent, PropertyHomeRoomListState> {
  final PropertyHomeRepository _repository;
  PropertyHomeRoomListBloc(this._repository) : super(_Initial()) {
    on<_FetchRooms>((event, emit) async {
      emit(PropertyHomeRoomListState.loading());
      log('Before');
      try {
        final roomList =
            await _repository.fetchPropertyRooms(propertyId: event.propertyId);
        emit(PropertyHomeRoomListState.loaded(roomList));
        log(roomList.toString());
      } catch (e) {
        emit(PropertyHomeRoomListState.error(e.toString()));
      }
    });
  }
}
