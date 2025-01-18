import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';
import 'package:user_resort_booking_app/feature/home/services/property_home_services.dart';

class MyBookingServices extends PropertyHomeServices {
  final _bookingCollection = FirebaseFirestore.instance.collection('bookings');

  Future<List<Map<String, dynamic>>> fetchMyBookings({
    required String userId,
  }) async {
    try {
      final data = await _bookingCollection
          .where(
            'userId',
            isEqualTo: userId,
          )
          .get();

      return data.docs
          .map(
            (e) => e.data(),
          )
          .toList();
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }
}
