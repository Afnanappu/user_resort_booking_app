import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_resort_booking_app/core/data/services/notification_services.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationServices _notificationServices;
  NotificationBloc(this._notificationServices) : super(_Initial()) {
    on<_InitNotification>((event, emit) async {
      await _notificationServices.initNotification(() {
        log('Notification is being initialized');
        _notificationServices.onMessageOpenedApp.listen(
          (message) {
            final notification = _notificationServices.handleMessage(message);
            if (notification == null) {
              return;
            }
            add(NotificationEvent.showNotification(notification));
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
      });
    });

    on<_ShowNotification>((event, emit) {
      emit(NotificationState.onNotification(event.notification));
    });
  }
}
