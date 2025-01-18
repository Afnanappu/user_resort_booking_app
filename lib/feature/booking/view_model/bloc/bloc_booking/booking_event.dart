part of 'booking_bloc.dart';

@freezed
class BookingEvent with _$BookingEvent {
  const factory BookingEvent.requestBooking({
    required BookingModel bookingModel,
    required List<RoomModel> roomList,
  }) = _RequestBooking;

  const factory BookingEvent.clear() = _ClearData;
}
