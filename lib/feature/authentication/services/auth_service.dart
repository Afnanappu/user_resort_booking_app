import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_resort_booking_app/core/data/models/user_model.dart';
import 'package:user_resort_booking_app/core/utils/custom_exceptions.dart';

class AuthService {
  final userCollection = 'users';
  Future<UserCredential> register(String email, String password) async {
    try {
      final user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e, stack) {
      final error = AppExceptionHandler.handleFirebaseAuthException(e);
      log(error, stackTrace: stack);
      throw error;
    } catch (e, stack) {
      final error = AppExceptionHandler.handleGenericException(e);
      log(error, stackTrace: stack);
      throw error;
    }
  }

  Future<void> addUserToCollections(UserModel user) async {
    try {
      final db = FirebaseFirestore.instance;
      final data = user.toMap();
      await db.collection(userCollection).doc(user.uid).set(data);
    } on FirebaseException catch (e, stack) {
      final error = AppExceptionHandler.handleFirestoreException(e);
      log(error, stackTrace: stack);
      throw error;
    } catch (e, stack) {
      final error = AppExceptionHandler.handleGenericException(e);
      log(error, stackTrace: stack);
      throw error;
    }
  }

  Future<UserCredential> loginWithEmail(String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e, stack) {
      final error = AppExceptionHandler.handleFirebaseAuthException(e);
      log(error, stackTrace: stack);
      throw error;
    } catch (e, stack) {
      final error = AppExceptionHandler.handleGenericException(e);
      log(error, stackTrace: stack);
      throw error;
    }
  }

  Future<Map<String, dynamic>> getUserFromCollection(String uid) async {
    try {
      final db = FirebaseFirestore.instance;
      final user = await db.collection(userCollection).doc(uid).get();
      if (user.exists) {
        return user.data()!;
      }
      throw 'No user found in this email, try registering';
    } on FirebaseException catch (e, stack) {
      final error = AppExceptionHandler.handleFirestoreException(e);
      log(error, stackTrace: stack);
      throw error;
    } catch (e, stack) {
      final error = AppExceptionHandler.handleGenericException(e);
      log(error, stackTrace: stack);
      throw error;
    }
  }

  Future<UserCredential> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      //  if(e.code == 'email-already-in-use'){

      // FirebaseAuth.instance.
      //     }

      try {
        final collection =
            FirebaseFirestore.instance.collection(userCollection);
        final data = (await collection
                .where('email', isEqualTo: googleUser?.email)
                .get())
            .docs;
        if (data.isEmpty) {
          throw 'Email is not registered, try registering';
        }
        log(data.first.data().toString());
      } catch (e) {
        rethrow;
      }

      final googleAuth = await googleUser?.authentication;
      log('accessToken: ${googleAuth?.accessToken}, idToken: ${googleAuth?.idToken}');
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final method = credential.signInMethod;
      log(method);

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e, stack) {
      final error = AppExceptionHandler.handleGenericException(e);
      log(error, stackTrace: stack);
      throw error;
    }
  }
}
