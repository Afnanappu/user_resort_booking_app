import 'dart:developer';

import 'package:user_resort_booking_app/core/data/models/property_card_model.dart';
import 'package:user_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';
import 'package:user_resort_booking_app/feature/profile/services/favorite_service.dart';

class FavoriteRepository {
  final FavoriteService _service;

  FavoriteRepository(this._service);

  Future<void> addToFavorite({
    required String propertyId,
    required String userId,
  }) async {
    try {
      await _service.addToFavorite(propertyId: propertyId, userId: userId);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeFromFavorite({
    required String propertyId,
    required String userId,
  }) async {
    try {
      await _service.removeFromFavorite(propertyId: propertyId, userId: userId);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> fetchFavoriteIds({required String userId}) async {
    try {
      return await _service.fetchFavoriteIds(userId: userId);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PropertyCardModel>> fetchFavorites(
      {required String userId}) async {
    try {
      final data = await _service.fetchFavorites(userId: userId);
      return data
          .map(
            (e) => PropertyCardModel.fromMap(e),
          )
          .toList();
    } on FormatException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFormatException(e);
    } catch (e) {
      rethrow;
    }
  }
}
