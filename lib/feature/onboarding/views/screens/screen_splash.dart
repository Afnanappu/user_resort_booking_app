import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/components/custom_circular_progress_indicator.dart';
import 'package:user_resort_booking_app/core/data/services/notification_services.dart';
import 'package:user_resort_booking_app/core/data/view_model/bloc/bloc_notification/notification_bloc.dart';
import 'package:user_resort_booking_app/core/utils/user_auth_state.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        if (userCurrentAuthState()) {
          context
              .read<NotificationBloc>()
              .add(NotificationEvent.updateNotification());
          return context.go('/${AppRoutes.home}');
        } else {
          return context.go('/${AppRoutes.login}');
        }
      },
    );

    return Scaffold(
      body: Center(child: CustomCircularProgressIndicator()),
    );
  }
}
