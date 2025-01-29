import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:user_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:user_resort_booking_app/feature/home/views/screens/screen_notification.dart';
// import 'package:user_resort_booking_app/routes/route_names.dart';

// final globalNavKey = GlobalKey<NavigatorState>();

Future<void> handleBackgroundMessaging(RemoteMessage message) async {
  log('Title: ${message.notification?.title}');
  log('Body: ${message.notification?.body}');
  log('Payload: ${message.data}');
}

class NotificationServices {
  final _firebaseMessaging = FirebaseMessaging.instance;

  RemoteMessage? handleMessage(RemoteMessage? message) {
    if (message == null) return null;
    // globalNavKey.currentState!.push(MaterialPageRoute(
    //   builder: (context) => ScreenNotification(),
    // ));
    return message;
  }

  Future<void> initPushNotification(Function callBack) async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    onBackgroundMessages();
    await callBack();
  }

  void onBackgroundMessages() =>
      FirebaseMessaging.onBackgroundMessage(handleBackgroundMessaging);

  Stream<RemoteMessage> get onMessageOpenedApp =>
      FirebaseMessaging.onMessageOpenedApp;

  Future<RemoteMessage?> getInitialMessages() =>
      FirebaseMessaging.instance.getInitialMessage();

  Future<void> initNotification([Function? callBack]) async {
    await _firebaseMessaging.requestPermission();

    final fCMToken = await getFcmToken();
    log('FCM Token: $fCMToken');
    if (callBack != null) {
      await initPushNotification(callBack);
    }

    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      final userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId != null) {
        // Send the new token to your server
        await updateToken(
          newFcmToken: newToken,
          userId: userId,
        );
      }
    });
  }

  Future<String?> getFcmToken() => _firebaseMessaging.getToken();

  Future<void> updateToken(
      {required String? newFcmToken, required String userId}) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'fcmToken': newFcmToken,
      });
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }
}
