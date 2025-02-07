import 'package:flutter/material.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';



class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 55,
          backgroundColor: MyColors.orange,
          backgroundImage: AssetImage(
            // appIconAsset,
            'assets/AppLogo.png',
          ),
        ),
      ),
    );
  }
}
