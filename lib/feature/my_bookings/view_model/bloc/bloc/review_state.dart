part of 'review_bloc.dart';

@freezed
class ReviewState with _$ReviewState {
  const factory ReviewState.initial() = _Initial;
  const factory ReviewState.error(String error) = _Error;
  const factory ReviewState.submitted(ReviewModel review) = _Submitted;
}
