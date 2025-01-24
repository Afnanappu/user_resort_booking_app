import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class RatingCountCubit extends Cubit<int> {
  RatingCountCubit() : super(2);

  void updateRating(int rating) {
    emit(rating);
    log('rating updated to $rating');
  }
}
