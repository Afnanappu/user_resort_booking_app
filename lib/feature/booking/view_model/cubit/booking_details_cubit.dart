import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_resort_booking_app/core/data/models/room_model.dart';
import 'package:user_resort_booking_app/core/data/models/booking_model.dart';

class BookingDetailsCubit extends Cubit<Map<String, dynamic>> {
  BookingDetailsCubit() : super({});

  void setBookingDetails(
      {required BookingModel bookingModel, required List<RoomModel> roomList}) {
    emit({
      'bookingModel': bookingModel,
      'roomList': roomList,
    });
  }

  void clear() {
    emit({});
  }
}
