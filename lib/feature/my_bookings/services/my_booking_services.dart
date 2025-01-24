import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_resort_booking_app/core/data/models/picked_date_range_model.dart';
import 'package:user_resort_booking_app/core/data/models/transaction_model.dart';
import 'package:user_resort_booking_app/core/data/services/review_services.dart';
import 'package:user_resort_booking_app/core/data/services/transaction_services.dart';
import 'package:user_resort_booking_app/core/utils/calculate_refund_amount.dart';
import 'package:user_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';
import 'package:user_resort_booking_app/feature/home/services/property_home_services.dart';
import 'package:user_resort_booking_app/feature/my_bookings/model/booked_property_details_model.dart';

class MyBookingServices extends PropertyHomeServices {
  MyBookingServices() : super(ReviewServices());
  final _userCollection = FirebaseFirestore.instance.collection('users');
  final _ownerCollection = FirebaseFirestore.instance.collection('owners');
  final _propertiesCollection =
      FirebaseFirestore.instance.collection('properties');
  final _roomCollectionName = 'rooms';
  final _bookingCollectionName = 'bookings';

  final TransactionServices transactionServices = TransactionServices();

  Future<List<Map<String, dynamic>>> fetchMyBookings({
    required String userId,
  }) async {
    try {
      final bookings = await _userCollection
          .doc(userId)
          .collection(_bookingCollectionName)
          .get();

      final List<Map<String, dynamic>> list = [];
      for (var element in bookings.docs) {
        final map = element.data();

        final ownerId = map['ownerId'] as String;
        final bookingId = map['bookingId'] as String;
        final book = await _ownerCollection
            .doc(ownerId)
            .collection(_bookingCollectionName)
            .doc(bookingId)
            .get();

        if (book.data() != null) {
          list.add(book.data()!);
        }
      }
      return list;
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<Map<String, dynamic>?> fetchBookingDetails({
    required String ownerId,
    required String bookingId,
  }) async {
    try {
      final data = await _ownerCollection
          .doc(ownerId)
          .collection(_bookingCollectionName)
          .doc(bookingId)
          .get();

      return data.data();
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  //room details
  Future<Map<String, dynamic>> fetchRoomDetails({
    required String propertyId,
    required String roomId,
  }) async {
    try {
      //fetching room details form room collection
      final data = await _propertiesCollection
          .doc(propertyId)
          .collection(_roomCollectionName)
          .doc(roomId)
          .get();
      return data.data()!;
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<void> cancelBooking({
    required BookedPropertyDetailsModel bookedPropertyDetailsModel,
  }) async {
    final ownerId = bookedPropertyDetailsModel.property.ownerId;
    final bookingId = bookedPropertyDetailsModel.bookingDetails.bookingId;
    final userId = bookedPropertyDetailsModel.bookingDetails.userId;
    final propertyId = bookedPropertyDetailsModel.property.id!;
    final bookedRoomIdList =
        bookedPropertyDetailsModel.bookingDetails.bookedRoomsId;

    final startDate = bookedPropertyDetailsModel.bookingDetails.startDate;
    final endDate = bookedPropertyDetailsModel.bookingDetails.endDate;

    final batch = FirebaseFirestore.instance.batch();

    //updating the owner collection of booking to status cancelled
    try {
      final resortBookedRef = _ownerCollection
          .doc(ownerId)
          .collection(_bookingCollectionName)
          .doc(bookingId);

      batch.update(
        resortBookedRef,
        {'status': 'Cancelled'},
      );

      //updating the property room availability
      for (var roomId in bookedRoomIdList) {
        final roomDoc = _propertiesCollection
            .doc(propertyId)
            .collection(_roomCollectionName)
            .doc(roomId);

        final data = await roomDoc.get();
        final bookedDays = (data.get('bookedDays') as List<dynamic>)
            .map(
              // (e) => PickedDateRangeModel(e['start'], e['end']),
              (e) => PickedDateRangeModel.fromMap(e),
            )
            .toList();

        final updatedBookedDateList = bookedDays.where((element) {
          final pickedDateRange = PickedDateRangeModel(
            startDate,
            endDate,
          );
          log('${element.toString()} != ${pickedDateRange.toString()}: ${element != pickedDateRange}');
          return (element.startDate != startDate && element.endDate != endDate);
        }).toList();

        final updatedDateToMap = updatedBookedDateList
            .map(
              (e) => e.toMap(),
            )
            .toList();
        batch.update(roomDoc, {'bookedDays': updatedDateToMap});
      }

      final amount = calculateRefundAmount(
        checkInTime: bookedPropertyDetailsModel.bookingDetails.startDate,
        cancellationTime: DateTime.now(),
        bookingTime: bookedPropertyDetailsModel.bookingDetails.createdAt,
        totalAmount: bookedPropertyDetailsModel.bookingDetails.totalPrice,
      );
      log('after calculated amount $amount');

      final transactionModel = TransactionModel(
        userId: userId,
        amount: amount,
        status: 'success',
        paymentMethod: 'Net-banking',
        type: 'credited',
        transactionDate: DateTime.now(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        ownerId: ownerId,
      );

      await transactionServices.makeTransaction(
        transactionModel: transactionModel,
        batch: batch,
      );

      await batch.commit(); //commit the updates
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }
}
