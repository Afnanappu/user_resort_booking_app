import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/data/services/notification_services.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

final globalNavKey = GlobalKey<NavigatorState>();

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationServices _notificationServices;
  NotificationBloc(this._notificationServices) : super(_Initial()) {
    on<_InitNotification>((event, emit) async {
      await _notificationServices.initNotification(
        initPushNotificationCb: () {
          _notificationServices.onMessageOpenedApp.listen(
            (message) {
              final notification = _notificationServices.handleMessage(message);
              if (notification == null) {
                return;
              }
              globalNavKey.currentContext!.go('/${AppRoutes.notification}');
              add(NotificationEvent.showNotification(notification));
            },
          );

          _notificationServices.onMessage.listen(
            (message) {
              final notification = message.notification;

              if (notification == null) {
                log('onMessage Notification is null');
                return;
              }

              _notificationServices.showLocalNotification(
                  notification, jsonEncode(message.toMap()));
            },
          );

          _notificationServices.getInitialMessages().then(
            (message) {
              final notification = _notificationServices.handleMessage(message);
              if (notification == null) {
                return;
              }

              add(NotificationEvent.showNotification(notification));
            },
          );
        },
        initLocalNotificationCb: (response) {
          if (response.payload == null) {
            log('payload is null', stackTrace: StackTrace.current);
            return;
          }
          final message = RemoteMessage.fromMap(jsonDecode(response.payload!));

          final notification = _notificationServices.handleMessage(message);
          if (notification == null) {
            return;
          }

          globalNavKey.currentContext!.go('/${AppRoutes.notification}');
          add(NotificationEvent.showNotification(notification));
        },
      );
    });

    on<_ShowNotification>((event, emit) {
      emit(NotificationState.onNotification(event.notification));
    });

    on<_UpdateNotification>((event, emit) async {
      final fcmToken = await _notificationServices.getFcmToken();
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        await _notificationServices.updateToken(
          newFcmToken: fcmToken,
          userId: userId,
        );
      }
      // emit(NotificationState.onNotification(event.notification));
    });
  }
}
