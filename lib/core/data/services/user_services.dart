import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_resort_booking_app/core/data/models/user_model.dart';
import 'package:user_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';

class UserServices {
  Future<Map<String, dynamic>?> fetchUserData() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    try {
      final data =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      return data.data();
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<void> updateUserData(UserModel userModel) async {
    try {
      final newUserModel = Map.fromEntries(
        userModel.toMap().entries.where(
              (entry) => entry.value != null,
            ),
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userModel.uid)
          .update(newUserModel);
      log('User data is updated');
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<void> backfillFavorites() async {
    // final usersCollection = FirebaseFirestore.instance.collection('users');
    // final querySnapshot = await usersCollection.get();
    // for (var doc in querySnapshot.docs) {
    //   if (!doc.data().containsKey('createdAt')) {
    //     await doc.reference.update({
    //       'favorites': [],
    //       'createdAt': Timestamp.fromDate(DateTime.now()),
    //       'updatedAt': Timestamp.fromDate(DateTime.now()),
    //     }); // Set default empty array
    //   }
    // }
  }
}
