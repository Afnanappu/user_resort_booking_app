import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
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

    final fCMToken = await _firebaseMessaging.getToken();
    log('FCM Token: $fCMToken');
    if (callBack != null) {
      await initPushNotification(callBack);
    }
  }
}
