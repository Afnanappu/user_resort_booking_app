part of 'review_bloc.dart';

@freezed
class ReviewEvent with _$ReviewEvent {
  const factory ReviewEvent.addReview(ReviewModel review) = _AddReview;
  const factory ReviewEvent.clear() = _Clear;
  const factory ReviewEvent.fetchMyReview(
      {required String propertyId, required String bookingId}) = _FetchMyReview;
}
