import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_resort_booking_app/feature/authentication/model/user_local_data_model.dart';

class UserLocalServices {
  final userBoxName = 'userBox';
  late Box<UserLocalDataModel> _box;

  Future<void> addUserLocally(UserLocalDataModel user) async {
    try {
      _box = await Hive.openBox<UserLocalDataModel>(userBoxName);
      await _box.put('user', user);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw 'Storing user data locally failed';
    }
  }

  Future<UserLocalDataModel?> getUserFromLocal() async {
    try {
      _box = await Hive.openBox<UserLocalDataModel>(userBoxName);
      return _box.get('user');
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw 'Storing user data locally failed';
    }
  }
}
