import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:user_resort_booking_app/core/components/custom_icon_widget.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/data/view_model/bloc/bloc_notification/notification_bloc.dart';
import 'package:user_resort_booking_app/core/utils/custom_date_formats.dart';
import 'package:user_resort_booking_app/feature/home/models/notification_model.dart';

class ScreenNotification extends StatelessWidget {
  const ScreenNotification({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context
            .read<NotificationBloc>()
            .add(NotificationEvent.fetchNotification());
      },
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notifications',
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => Center(
              child: Text('Loading...'),
            ),
            error: (message) => Center(
              child: Text(message),
            ),
            orElse: () => Center(
              child: Text('An unexpected error occurred'),
            ),
            onNotification: (notifications) {
              return notifications.isEmpty
                  ? Center(child: Text('Notification is empty'))
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return
                            // Dismissible(
                            //   key: Key(notification.hashCode.toString()),
                            //   direction: DismissDirection.endToStart,

                            //   onDismissed: (direction) {
                            //     //Add function to delete message
                            //   },
                            //   background: _deleteCard(),
                            //   child:
                            NotificationCard(
                          notification: notification,
                          // ),
                        );
                      },
                    );
            },
          );
        },
      ),
    );
  }

  // ignore: unused_element
  Card _deleteCard() {
    return Card(
      color: MyColors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CustomIconTextWidget(
              content: Text(
                'Delete',
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: Icon(
                Icons.delete,
                color: MyColors.white,
                size: 35,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notification,
  });
  final NotificationModel notification;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        leading: notification.icon != null
            ? Icon(notification.icon, color: Colors.blue)
            : null,
        title: Text(
          notification.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.body),
            const SizedBox(height: 4),
            Text(
              customDateFormat(notification.sentAt),
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        onTap: () {
          // Handle notification tap (e.g., navigate to a details page)
        },
      ),
    );
  }
}
