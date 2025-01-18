
import 'package:flutter/material.dart';
import 'package:user_resort_booking_app/core/components/custom_circular_progress_indicator.dart';

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
