import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:user_resort_booking_app/core/components/custom_circular_progress_indicator.dart';
import 'package:user_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/data/providers/user_provider.dart';
import 'package:user_resort_booking_app/core/utils/app_connection.dart';
import 'package:user_resort_booking_app/core/utils/user_auth_state.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        // await context.read<UserProvider>().getUserLocalData();
        // if (userCurrentAuthState()) {
        //   final connection = await AppConnection.checkConnectionState();
        //   log('This app is currently in ${connection ? "online" : "offline"}');
        //   if (connection) {
        //     await context.read<UserProvider>().fetchUserDataFromFirebase();
        //     await context.read<UserProvider>().storeUserDataLocally();
        //   } else {
        //     showCustomSnackBar(
        //       context: context,
        //       message: 'The app is currently running in offline',
        //       bgColor: MyColors.grey,
        //     );
        //   }
        //   return context.go('/${AppRoutes.home}');
        // } else {
        //   return context.go('/${AppRoutes.login}');
        // }
      },
    );

    return Scaffold(
      body: Center(child: CustomCircularProgressIndicator()),
    );
  }
}
