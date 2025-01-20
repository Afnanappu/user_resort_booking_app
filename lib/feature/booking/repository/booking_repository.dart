import 'dart:developer';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:user_resort_booking_app/core/data/models/room_model.dart';
import 'package:user_resort_booking_app/core/data/models/booking_model.dart';
import 'package:user_resort_booking_app/core/data/models/transaction_model.dart';
import 'package:user_resort_booking_app/feature/booking/services/booking_service.dart';

class BookingRepository {
  final BookingService _services;

  BookingRepository({required BookingService service}) : _services = service;

  Future<List<RoomModel>> fetchPropertyRooms({
    required String propertyId,
    PickerDateRange? selectedDateRange,
  }) async {
    try {
      final data = await _services.fetchPropertyRooms(propertyId: propertyId);
      final roomList = data
          .map(
            (e) => RoomModel.fromMap(e),
          )
          .toList();

      if (selectedDateRange == null) {
        return roomList;
      } else {
        final selectedStart = selectedDateRange.startDate!;
        final selectedEnd = selectedDateRange.endDate!;
        // final list = [
        // PickerDateRange(
        //   DateTime(2025, 1, 17),
        //   DateTime(2025, 1, 19),
        // ),
        // PickerDateRange(
        //   DateTime(2025, 1, 25),
        //   DateTime(2025, 1, 28),
        // ),
        // ];
        final filteredList = roomList.where(
          (room) {
            for (var range in room.bookedDays) {
              // log(
              //   'if(${selectedEnd.isBefore(range.startDate!)} || ${selectedStart.isAfter(range.endDate!)}) ==  ${!(selectedEnd.isBefore(range.startDate!) || selectedStart.isAfter(range.endDate!))}',
              // );
              // log('$selectedEnd.isBefore(${range.startDate}) || $selectedStart.isBefore(${range.endDate})');

              if (!(selectedEnd.isBefore(range.startDate!) ||
                  selectedStart.isAfter(range.endDate!))) {
                return false;
              }
            }

            return true;
          },
        ).toList();

        log('Filtered room length: ${filteredList.length}');

        return filteredList;
      }
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  //fetch room details
  Future<RoomModel> fetchRoomDetails({
    required String propertyId,
    required String roomId,
  }) async {
    try {
      final data = await _services.fetchRoomDetails(
        propertyId: propertyId,
        roomId: roomId,
      );
      return RoomModel.fromMap(data);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  //Book rooms
  Future<String> bookRooms({
    required BookingModel bookingModel,
    required List<RoomModel> roomList,
    required String ownerId,
  }) async {
    try {
      //calling book room function
      return await _services.bookRooms(
        bookingModel: bookingModel,
        roomList: roomList,
        ownerId: ownerId,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> failedBooking({
    required TransactionModel transactionModel,
  }) async {
    try {
      await _services.transactionServices.makeTransaction(
        transactionModel: transactionModel,
        owner: false,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<BookingModel> fetchBookingDetails({
    required String bookingId,
    required String ownerId,
  }) async {
    try {
      final data = await _services.fetchBookingDetails(
        bookingId: bookingId,
        ownerId: ownerId,
      );
      if (data != null) {
        return BookingModel.fromMap(data);
      } else {
        throw FormatException('Booking model data is null');
      }
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }
}
