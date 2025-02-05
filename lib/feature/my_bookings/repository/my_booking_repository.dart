import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_resort_booking_app/core/data/models/booking_model.dart';
import 'package:user_resort_booking_app/core/data/models/picked_file_model.dart';
import 'package:user_resort_booking_app/core/data/models/room_model.dart';
import 'package:user_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';
import 'package:user_resort_booking_app/feature/home/models/property_details_model.dart';
import 'package:user_resort_booking_app/feature/my_bookings/model/booked_property_card_model.dart';
import 'package:user_resort_booking_app/feature/my_bookings/model/booked_property_details_model.dart';
import 'package:user_resort_booking_app/feature/my_bookings/services/my_booking_services.dart';

class MyBookingRepository {
  final MyBookingServices _services;

  MyBookingRepository({required MyBookingServices services})
      : _services = services;

  Future<List<BookedPropertyCardModel>> fetchMyBookings({
    required String userId,
    String? type,
  }) async {
    try {
      final bookingData = await _services.fetchMyBookings(userId: userId);
      List<BookedPropertyCardModel> bookedModelList = [];
      for (var booking in bookingData) {
        final propertyId = booking['propertyId'] as String;
        final propertyData =
            await _services.fetchPropertyDetails(id: propertyId);

        bookedModelList.add(BookedPropertyCardModel(
          bookingId: booking['bookingId'],
          propertyName: propertyData['name'],
          startDate: (booking['startDate'] as Timestamp).toDate(),
          endDate: (booking['endDate'] as Timestamp).toDate(),
          price: booking['totalPrice'].toString(),
          imageUrl: PickedFileModel.fromMap(
            (propertyData['images'] as List<dynamic>).first,
          ).base64file,
          status: booking['status'],
          ownerId: propertyData['ownerId'] as String,
        ));
      }
      if (type == null || type == 'all') {
        return bookedModelList;
      } else {
        log('filtering bookings by $type');
        return bookedModelList
            .where(
              (element) => element.status.toLowerCase() == type,
            )
            .toList();
      }
    } on FormatException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFormatException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  Future<BookedPropertyDetailsModel> fetchBookingDetails(
      {required String ownerId, required String bookingId}) async {
    try {
      //fetching bookingDetails
      final bookingData = await _services.fetchBookingDetails(
        ownerId: ownerId,
        bookingId: bookingId,
      );
      if (bookingData == null) {
        throw FormatException('Booking details data is null');
      }
      final bookingModel = BookingModel.fromMap(bookingData);

      final propertyData =
          await _services.fetchPropertyDetails(id: bookingModel.propertyId);

      final propertyDetailsModel = PropertyDetailsModel.fromMap(propertyData);

      final List<Map<String, dynamic>> roomDataList = [];

      for (var roomId in bookingModel.bookedRoomsId) {
        final roomData = await _services.fetchRoomDetails(
            propertyId: propertyDetailsModel.id!, roomId: roomId);
        roomDataList.add(roomData);
      }

      final List<RoomModel> roomModelList = roomDataList
          .map(
            (e) => RoomModel.fromMap(e),
          )
          .toList();

      final bookedPropertyDetailsModel = BookedPropertyDetailsModel(
        property: propertyDetailsModel,
        bookedRooms: roomModelList,
        bookingDetails: bookingModel,
      );

      return bookedPropertyDetailsModel;
    } on FormatException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFormatException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  Future<void> cancelBooking({
    required BookedPropertyDetailsModel bookedPropertyDetailsModel,
  }) async {
    try {
      await _services.cancelBooking(
          bookedPropertyDetailsModel: bookedPropertyDetailsModel);
    } catch (e) {
      rethrow;
    }
  }
}
