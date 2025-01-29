import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_resort_booking_app/core/data/services/review_services.dart';
import 'package:user_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';
import 'package:user_resort_booking_app/feature/home/services/property_home_services.dart';

class FavoriteService {
  final PropertyHomeServices _propertyHomeServices =
      PropertyHomeServices(ReviewServices());
  // final _propertiesCollection =
  //     FirebaseFirestore.instance.collection('properties');
  final _userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> addToFavorite({
    required String propertyId,
    required String userId,
  }) async {
    try {
      await _userCollection.doc(userId).update({
        'favorites': FieldValue.arrayUnion([propertyId])
      });
      log('$propertyId is added to favorites');
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<void> removeFromFavorite({
    required String propertyId,
    required String userId,
  }) async {
    try {
      await _userCollection.doc(userId).update({
        'favorites': FieldValue.arrayRemove([propertyId])
      });
      log('$propertyId is removed from favorites');
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<List<String>> fetchFavoriteIds({required String userId}) async {
    final data = await _userCollection.doc(userId).get();

    return List<String>.from(data.get('favorites') as List<dynamic>);
  }

  Future<List<Map<String, dynamic>>> fetchFavorites(
      {required String userId}) async {
    try {
      final favoritesData = await fetchFavoriteIds(userId: userId);

      final List<Map<String, dynamic>> list = [];
      for (var id in favoritesData) {
        final propertyData =
            await _propertyHomeServices.fetchPropertyDetails(id: id);

        list.add(propertyData);
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
}
