part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.initNotification() = _InitNotification;
  const factory NotificationEvent.showNotification(RemoteMessage notification) =
      _ShowNotification;
}
