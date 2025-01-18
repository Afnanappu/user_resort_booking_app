import 'package:flutter_bloc/flutter_bloc.dart';

class BookingSelectPeopleCubit extends Cubit<int> {
  BookingSelectPeopleCubit() : super(2);

  void setPeople(int peopleNumber) {
    emit(peopleNumber);
  }

  void clear() {
    emit(2);
  }
}
