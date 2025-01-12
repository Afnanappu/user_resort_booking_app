import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';

class PropertyHomeServices {
  final _propertiesCollection =
      FirebaseFirestore.instance.collection('properties');
  final _roomCollectionName = 'rooms';

  //All this owner property
  Future<List<Map<String, dynamic>>> fetchProperties() async {
    try {
      // final add = await FirebaseFirestore.instance
      //     .collection('additional_options')
      //     .get();
      // final d = add.docs.map(
      //   (e) => log(e.data().toString()),
      // );

      final data = await _propertiesCollection.get();
      log('Data fetched from fireStore');
      log(data.size.toString());
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
  Future<Map<String, dynamic>> fetchPropertyDetails(
      {required String id}) async {
    try {
      final data = await _propertiesCollection.doc(id).get();
      return data.data()!;
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  
  Future<List<Map<String, dynamic>>> fetchPropertyRooms(
      {required String propertyId}) async {
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
}
