import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:user_resort_booking_app/core/data/models/user_model.dart';
import 'package:user_resort_booking_app/core/data/repository/user_repository.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

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

  void isUserBlocked(BuildContext context) {
    _repository.isUserBlocked().listen(
      (isBlocked) {
        if (isBlocked == true) {
          customAlertDialog(
            context: context,
            barrierDismissible: false,
            title: 'Your account is blocked by the admin',
            content: 'contact the admin for more information',
            firstText: 'Ok',
            firstOnPressed: () async {
              context.go('/${AppRoutes.login}');
              await FirebaseAuth.instance.signOut();
            },
          );
        }
      },
    );
  }
}
