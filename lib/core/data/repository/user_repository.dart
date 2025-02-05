import 'dart:developer';

import 'package:user_resort_booking_app/core/data/models/user_model.dart';
import 'package:user_resort_booking_app/core/data/services/user_services.dart';

class UserRepository {
  final UserServices _services;

  UserRepository({required UserServices services}) : _services = services;

  Future<UserModel> fetchUserData() async {
    try {
      final data = await _services.fetchUserData();
      return UserModel.fromMap(data!);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  Future<void> updateUserData(UserModel userModel) async {
    try {
      await _services.updateUserData(userModel);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  Future<void> updateFields() async {
    await _services.backfillFavorites();
  }

  Stream<bool> isUserBlocked() => _services.isUserBlocked();
}
