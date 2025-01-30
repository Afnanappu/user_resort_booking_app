import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_resort_booking_app/core/data/models/user_model.dart';
import 'package:user_resort_booking_app/core/data/repository/user_repository.dart';

class UserDataCubit extends Cubit<UserModel?> {
  final UserRepository _repository;
  UserDataCubit(this._repository) : super(null);

  Future<void> fetchUserData() async {
    try {
      final user = await _repository.fetchUserData();
      emit(user);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
    }
  }

  void setUser(UserModel userModel) {
    emit(userModel);
  }

  Future<void> updateUserData(UserModel userModel) async {
    try {
      await _repository.updateUserData(userModel);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
    }
  }

  void updateFields() async {
    await _repository.updateFields();
  }
}
