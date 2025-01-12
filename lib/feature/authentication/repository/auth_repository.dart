import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_resort_booking_app/core/data/models/user_model.dart';
import 'package:user_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';
import 'package:user_resort_booking_app/feature/authentication/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository({required AuthService authService})
      : _authService = authService;

  Future<void> register(String name, String email, String password) async {
    try {
      //First create an account for the user
      final user = (await _authService.register(email, password)).user;
      log('User registered');
      //Then add the user data to firestore for future needs
      await _authService.addUserToCollections(UserModel(
        uid: user!.uid,
        name: name,
        email: email,
      ));
      log('User created in fireStore');
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> loginWithEmail(String email, String password) async {
    try {
      final user = (await _authService.loginWithEmail(email, password)).user;
      return await fetchUserDataFromFirebase(user!.uid);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> fetchUserDataFromFirebase(String uid) async {
    try {
      final user = await _authService.getUserFromCollection(uid);

      return UserModel.fromMap(user);
    } on FormatException catch (e, stack) {
      log("Format Exception: message: ${e.message}, ${e.source}",
          stackTrace: stack);
      throw AppExceptionHandler.handleFormatException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

  Future<UserModel> loginWithGoogle() async {
    try {
      final user = (await _authService.loginWithGoogle()).user;
      log('user.uid: ${user?.uid}');
      return await fetchUserDataFromFirebase(user!.uid);
    } catch (e) {
      await GoogleSignIn().signOut();
      rethrow;
    }
  }
}
