import 'dart:developer';

import 'package:user_resort_booking_app/core/data/models/review_model.dart';
import 'package:user_resort_booking_app/core/data/services/review_services.dart';

class ReviewRepository {
  final ReviewServices _services;

  ReviewRepository(this._services);

  Future<void> addReview(ReviewModel review) async {
    try {
      await _services.addReview(review);
    } catch (e) {
      rethrow;
    }
  }

  Future<ReviewModel?> fetchMyReview(
      {required String propertyId, required String bookingId}) async {
    try {
      final data =
          await _services.fetchMyReview(propertyId: propertyId, bookingId: bookingId);
      return data != null ? ReviewModel.fromMap(data) : null;
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  Future<List<ReviewModel>> fetchReviews(String propertyId) async {
    try {
      final data = await _services.fetchReviews(propertyId);

      return data
          .map(
            (e) => ReviewModel.fromMap(e),
          )
          .toList();
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }
}
