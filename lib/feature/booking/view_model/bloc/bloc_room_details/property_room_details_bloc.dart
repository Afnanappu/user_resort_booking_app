import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_resort_booking_app/core/data/models/room_model.dart';
import 'package:user_resort_booking_app/feature/booking/repository/booking_repository.dart';
part 'property_room_details_event.dart';
part 'property_room_details_state.dart';
part 'property_room_details_bloc.freezed.dart';

class PropertyRoomDetailsBloc
    extends Bloc<PropertyRoomDetailsEvent, PropertyRoomDetailsState> {
  final BookingRepository _repository;
  PropertyRoomDetailsBloc(this._repository) : super(_Initial()) {
    on<_FetchRoomDetails>((event, emit) async {
      emit(PropertyRoomDetailsState.loading());

      try {
        final roomDetailsModel = await _repository.fetchRoomDetails(
          propertyId: event.propertyId,
          roomId: event.roomId,
        );
        emit(PropertyRoomDetailsState.loaded(roomDetailsModel));
        log(roomDetailsModel.toString());
      } catch (e, stack) {
        log(e.toString(), stackTrace: stack);
        emit(PropertyRoomDetailsState.error(e.toString()));
      }
    });
  }

 
}
