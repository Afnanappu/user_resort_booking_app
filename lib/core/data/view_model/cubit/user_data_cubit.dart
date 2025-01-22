import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_resort_booking_app/core/data/models/user_model.dart';
import 'package:user_resort_booking_app/core/data/repository/user_repository.dart';

class UserDataCubit extends Cubit<UserModel?> {
  final UserRepository _repository;
  UserDataCubit(this._repository) : super(null);

  void fetchUserData() async {
    final user = await _repository.fetchUserData();
    emit(user);
  }

  void setUser(UserModel userModel) {
    emit(userModel);
  }

  void updateFields() async {
   await _repository.updateFields();
  }
}
