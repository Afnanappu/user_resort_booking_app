import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_resort_booking_app/core/components/elevated_button_auth.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenOnboarding2 extends StatelessWidget {
  const ScreenOnboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MyScreenSize.height,
        width: MyScreenSize.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MySpaces.flex1,

            //image
            Image.asset(
              'assets/summer-vacation-tropical-resort-cartoon-vector-removebg.png',
              height: 200,
            ),
            MySpaces.hSpace60,

            //center text
            Text(
              'Find best resort for you',
              style: GoogleFonts.aclonica(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            MySpaces.hSpace10,
            Text('book one of your unique resort to \nescape the ordinary',
                textAlign: TextAlign.center,
                style: MyTextStyles.bodySmallMediumGreyLight),
            MySpaces.hSpace80,

            //auth buttons
            //login
            ElevatedButtonAuthentication(
              title: 'Login',
              onPressed: () => context.go('/${AppRoutes.login}'),
              haveBg: false,
            ),
            MySpaces.hSpace10,

            //signin
            ElevatedButtonAuthentication(
              title: 'Sign up',
              onPressed: () => context.go('/${AppRoutes.signUp}'),
            ),
            MySpaces.flex1,
          ],
        ),
      ),
    );
  }
}
