import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_resort_booking_app/core/data/models/room_model.dart';
import 'package:user_resort_booking_app/core/utils/custom_id_generate.dart';
import 'package:user_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';
import 'package:user_resort_booking_app/core/data/models/booking_model.dart';

class BookingService {
  final _propertiesCollection =
      FirebaseFirestore.instance.collection('properties');
  final _roomCollectionName = 'rooms';

  final _bookingCollection = FirebaseFirestore.instance.collection('bookings');

  Future<List<Map<String, dynamic>>> fetchPropertyRooms({
    required String propertyId,
  }) async {
    try {
      final data = await _propertiesCollection
          .doc(propertyId)
          .collection(_roomCollectionName)
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

  //Property details
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

  //Book Rooms

  Future<String> bookRooms({
    required BookingModel bookingModel,
    required List<RoomModel> roomList,
  }) async {
    if (roomList.isEmpty) {
      throw ArgumentError('Room list cannot be empty');
    }

    if (bookingModel.propertyId.isEmpty) {
      throw ArgumentError('Property ID cannot be empty');
    }

    final batch = FirebaseFirestore.instance.batch();

    // Update each room's bookedDays
    try {
      for (final room in roomList) {
        final roomRef = _propertiesCollection
            .doc(bookingModel.propertyId)
            .collection(_roomCollectionName)
            .doc(room.id);

        batch.update(roomRef, {
          'bookedDays': FieldValue.arrayUnion([
            {
              'start': bookingModel.startDate,
              'end': bookingModel.endDate,
            },
          ])
        });
      }

      final bookingId = customIdGenerate(
        prefix: 'Scap',
        separator: '_',
      );

      log('Booking Id: $bookingId');

      // Add booking document
      final doc = _bookingCollection.doc(bookingId);
      bookingModel.bookingId = doc.id;
      batch.set(doc, bookingModel.toMap());

      // Commit the batch
      await batch.commit();

      return bookingId;
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<Map<String, dynamic>?> fetchBookingDetails(
      {required String bookingId}) async {
    try {
      final data = await _bookingCollection.doc(bookingId).get();
      return data.data();
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }
}
