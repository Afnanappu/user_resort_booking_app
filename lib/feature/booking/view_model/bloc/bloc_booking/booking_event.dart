part of 'booking_bloc.dart';

@freezed
class BookingEvent with _$BookingEvent {
  const factory BookingEvent.requestBooking({
    required BookingModel bookingModel,
    required List<RoomModel> roomList,
    required String ownerId,
  }) = _RequestBooking;

  const factory BookingEvent.failedBooking({
    required TransactionModel transactionModel,
  }) = _FailedBooking;
  const factory BookingEvent.clear() = _ClearData;
}
