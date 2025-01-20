import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_resort_booking_app/core/data/models/room_model.dart';
import 'package:user_resort_booking_app/core/data/models/booking_model.dart';
import 'package:user_resort_booking_app/core/data/models/transaction_model.dart';
import 'package:user_resort_booking_app/feature/booking/repository/booking_repository.dart';

part 'booking_event.dart';
part 'booking_state.dart';
part 'booking_bloc.freezed.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository _repository;
  BookingBloc(this._repository) : super(_Initial()) {
    on<_RequestBooking>((event, emit) async {
      emit(BookingState.loading());

      try {
        final bookingId = await _repository.bookRooms(
          bookingModel: event.bookingModel,
          roomList: event.roomList,
          ownerId: event.ownerId,
        );

        final bookingDetails = await _repository.fetchBookingDetails(
          bookingId: bookingId,
          ownerId: event.ownerId,
        );
        emit(BookingState.booked(bookingDetails));
      } catch (e) {
        emit(BookingState.error(e.toString()));
      }
    });

    on<_FailedBooking>((event, emit) async {
      emit(BookingState.loading());

      try {
        //
        await _repository.failedBooking(
          transactionModel: event.transactionModel,
        );
        emit(BookingState.failed());
      } catch (e) {
        emit(BookingState.error(e.toString()));
      }
    });
    on<_ClearData>((event, emit) {
      emit(BookingState.initial());
    });
  }
}
