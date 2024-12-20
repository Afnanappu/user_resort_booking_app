import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:user_resort_booking_app/core/data/models/user_model.dart';
import 'package:user_resort_booking_app/feature/authentication/model/user_local_data_model.dart';
import 'package:user_resort_booking_app/feature/authentication/repository/auth_repository.dart';
import 'package:user_resort_booking_app/feature/authentication/repository/user_local_repository.dart';

class UserProvider extends ChangeNotifier {
  final UserLocalRepository _userLocalRepository;
  final AuthRepository _authRepository;
  late UserModel user;

  UserProvider(
      {required UserLocalRepository userLocalRepository,
      required AuthRepository authRepository})
      : _userLocalRepository = userLocalRepository,
        _authRepository = authRepository;

  Future<void> setUser(UserModel userModel, [bool save = true]) async {
    user = userModel;
    if (save) {
      await storeUserDataLocally();
    }
    notifyListeners();
  }

  Future<void> storeUserDataLocally() async {
    try {
      await _userLocalRepository.addUserLocally(user);
    } catch (e) {
      log('An unknown error occurred while storing user data locally');
    }
  }

  Future<UserLocalDataModel?> getUserLocalData() async {
    try {
      final userLocalData = await _userLocalRepository.getLocalUserData();
      if (userLocalData != null) {
        user = UserModel(
          name: userLocalData.name,
          email: userLocalData.email,
          profilePicture: userLocalData.profilePicture,
          uid: userLocalData.uid,
        );
      }
      notifyListeners();

      return userLocalData;
    } catch (e, stack) {
      log('An unknown error occurred while storing user data locally',
          stackTrace: stack);
      return null;
    }
  }

  Future<void> fetchUserDataFromFirebase() async {
    try {
      user = await _authRepository.fetchUserDataFromFirebase(user.uid!);
    } catch (e, stack) {
      log('An unknown error occurred while fetching data from firebase',
          stackTrace: stack);
      return null;
    }
  }
}
