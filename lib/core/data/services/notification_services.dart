import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:user_resort_booking_app/core/constants/my_constants.dart';
import 'package:user_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:user_resort_booking_app/feature/home/views/screens/screen_notification.dart';
// import 'package:user_resort_booking_app/routes/route_names.dart';

Future<void> handleBackgroundMessaging(RemoteMessage message) async {
  log('Title: ${message.notification?.title}');
  log('Body: ${message.notification?.body}');
  log('Payload: ${message.data}');
}

class NotificationServices {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _localNotification = FlutterLocalNotificationsPlugin();

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

  Future<void> initLocalNotification(
    void Function(NotificationResponse)? onNotification,
  ) async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings(appIconAndroid);
    const settings = InitializationSettings(android: android, iOS: iOS);

    _localNotification.initialize(
      settings,
      onDidReceiveNotificationResponse: onNotification,
    );

    final platform = _localNotification.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await platform?.createNotificationChannel(AndroidNotificationChannel(
      'high_importance_channel',
      'High_Importance_Notifications',
    ));
  }

  Stream<RemoteMessage> get onMessage => FirebaseMessaging.onMessage;

  void onBackgroundMessages() =>
      FirebaseMessaging.onBackgroundMessage(handleBackgroundMessaging);

  Stream<RemoteMessage> get onMessageOpenedApp =>
      FirebaseMessaging.onMessageOpenedApp;

  Future<RemoteMessage?> getInitialMessages() =>
      FirebaseMessaging.instance.getInitialMessage();

  Future<void> initNotification({
    required Function initPushNotificationCb,
    required void Function(NotificationResponse response)
        initLocalNotificationCb,
  }) async {
    await _firebaseMessaging.requestPermission();

    final fCMToken = await getFcmToken();
    log('FCM Token: $fCMToken');
    // if (initPushNotificationCb != null) {
    await initPushNotification(initPushNotificationCb);
    // }
    // if (initLocalNotificationCb != null) {
    await initLocalNotification(initLocalNotificationCb);
    // }

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

  //----LocalNotification----

  void showLocalNotification(RemoteNotification notification, String? payload) {
    _localNotification.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: _androidDetails,
        iOS: _iosDetails,
      ),
      payload: payload,
    );
  }

  final _androidDetails = AndroidNotificationDetails(
    'high_importance_channel',
    'High_Importance_Notifications',
    channelDescription: 'This channel is used for important notifications.',
    importance: Importance.high,
    priority: Priority.high,
    icon: appIconAndroid,
  );

  final _iosDetails = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );
}
