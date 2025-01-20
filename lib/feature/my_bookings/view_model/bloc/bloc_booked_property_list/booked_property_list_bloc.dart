import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_resort_booking_app/feature/my_bookings/model/booked_property_card_model.dart';
import 'package:user_resort_booking_app/feature/my_bookings/repository/my_booking_repository.dart';

part 'booked_property_list_event.dart';
part 'booked_property_list_state.dart';
part 'booked_property_list_bloc.freezed.dart';

class BookedPropertyListBloc
    extends Bloc<BookedPropertyListEvent, BookedPropertyListState> {
  final MyBookingRepository _repository;
  BookedPropertyListBloc(this._repository) : super(_Initial()) {
    on<_FetchMyBookings>((event, emit) async {
      emit(BookedPropertyListState.loading());

      try {
        final bookedModelList = await _repository.fetchMyBookings(
          userId: event.userId,
          type: event.type?.toLowerCase(),
        );
        emit(BookedPropertyListState.loaded(bookedModelList));
      } catch (e) {
        log(e.toString());
        emit(BookedPropertyListState.error(e.toString()));
      }
    });
  }
}
