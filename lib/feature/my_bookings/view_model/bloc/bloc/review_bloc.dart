import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_resort_booking_app/core/data/models/review_model.dart';
import 'package:user_resort_booking_app/core/data/repository/review_repository.dart';

part 'review_event.dart';
part 'review_state.dart';
part 'review_bloc.freezed.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ReviewRepository _repository;
  ReviewBloc(this._repository) : super(_Initial()) {
    on<_AddReview>((event, emit) async {
      try {
        await _repository.addReview(event.review);
        emit(ReviewState.submitted(event.review));
      } catch (e) {
        emit(ReviewState.initial());
      }
    });
    on<_FetchMyReview>((event, emit) async {
      try {
        final reviewModel = await _repository.fetchMyReview(
            propertyId: event.propertyId, bookingId: event.bookingId);
        if (reviewModel == null) {
          emit(ReviewState.initial());
        } else {
          emit(ReviewState.submitted(reviewModel));
        }
      } catch (e) {
        emit(ReviewState.initial());
      }
    });

    on<_Clear>(
      (event, emit) => emit(ReviewState.initial()),
    );
  }
}
