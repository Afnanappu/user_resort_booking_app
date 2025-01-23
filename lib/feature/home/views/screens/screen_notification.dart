import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:user_resort_booking_app/core/data/view_model/bloc/bloc_notification/notification_bloc.dart';

class ScreenNotification extends StatelessWidget {
  const ScreenNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notifications',
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => Center(
              child: Text('Loading'),
            ),
            loading: () => Center(
              child: Text('Loading'),
            ),
            error: (message) => Center(
              child: Text(message),
            ),
            orElse: () => Center(
              child: Text('An unexpected error occurred'),
            ),
            onNotification: (notification) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(notification.notification?.title ?? 'title is null'),
                    Text(notification.notification?.body ?? 'body is null'),
                    Text(notification.data.toString()),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
