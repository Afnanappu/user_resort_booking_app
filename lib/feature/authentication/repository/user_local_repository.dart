import 'dart:developer';

import 'package:user_resort_booking_app/core/data/models/user_model.dart';
import 'package:user_resort_booking_app/feature/authentication/model/user_local_data_model.dart';
import 'package:user_resort_booking_app/feature/authentication/services/user_local_service.dart';

class UserLocalRepository {
  final UserLocalServices _userLocalServices;

  UserLocalRepository({required UserLocalServices userLocalServices})
      : _userLocalServices = userLocalServices;

  Future<void> addUserLocally(UserModel user) async {
    try {
      final storingData = UserLocalDataModel(
        name: user.name,
        email: user.email,
        profilePicture: user.profilePicture,
        uid: user.uid,
      );

      await _userLocalServices.addUserLocally(storingData);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  Future<UserLocalDataModel?> getLocalUserData() async {
    try {
      return await _userLocalServices.getUserFromLocal();
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }
}
