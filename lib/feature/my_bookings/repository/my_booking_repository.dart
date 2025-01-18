import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_resort_booking_app/core/data/models/picked_file_model.dart';
import 'package:user_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';
import 'package:user_resort_booking_app/feature/my_bookings/model/booked_property_card_model.dart';
import 'package:user_resort_booking_app/feature/my_bookings/services/my_booking_services.dart';

class MyBookingRepository {
  final MyBookingServices _services;

  MyBookingRepository({required MyBookingServices services})
      : _services = services;

  Future<List<BookedPropertyCardModel>> fetchMyBookings(
      {required String userId}) async {
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
                  (propertyData['images'] as List<dynamic>).first)
              .base64file,
          status: booking['status'],
        ));
      }

      return bookedModelList;
    } on FormatException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFormatException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }
}
