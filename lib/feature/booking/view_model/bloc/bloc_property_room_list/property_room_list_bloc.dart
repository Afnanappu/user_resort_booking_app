import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:user_resort_booking_app/core/data/models/room_model.dart';
import 'package:user_resort_booking_app/feature/booking/repository/booking_repository.dart';

part 'property_room_list_event.dart';
part 'property_room_list_state.dart';
part 'property_room_list_bloc.freezed.dart';

class PropertyRoomListBloc
    extends Bloc<PropertyRoomListEvent, PropertyRoomListState> {
  final BookingRepository _repository;
  PropertyRoomListBloc(this._repository) : super(_Initial()) {
    on<_FetchRooms>((event, emit) async {
      emit(PropertyRoomListState.loading());
      log('Before');
      try {
        final roomList =
            await _repository.fetchPropertyRooms(propertyId: event.propertyId,selectedDateRange: event.selectedDateRange);
        emit(PropertyRoomListState.loaded(roomList));
        log(roomList.toString());
      } catch (e) {
        emit(PropertyRoomListState.error(e.toString()));
      }
    });
  }
}
