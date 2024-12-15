import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_resort_booking_app/core/components/elevated_button_auth.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenOnboarding extends StatelessWidget {
  const ScreenOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        //background image
        Image.asset(
          'assets/komar-beach-resort.jpg',
          height: MyScreenSize.height,
          fit: BoxFit.fitHeight,
          filterQuality: FilterQuality.high,
          color: const Color.fromARGB(64, 0, 0, 0),
          colorBlendMode: BlendMode.darken,
        ),

        //main heading
        Positioned(
          top: MyScreenSize.height / 5,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Find Resort That's ",
              children: [
                TextSpan(
                  text: "Good \n& Suites",
                  style: TextStyle(color: MyColors.orange),
                ),
                TextSpan(text: ' To You'),
              ],
              style: GoogleFonts.itim(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),

        //button get started
        Positioned(
          bottom: 75,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  blurRadius: 100,
                  spreadRadius: 0,
                )
              ],
            ),
            child: ElevatedButtonAuthentication(
              height: 50,
              fontSize: 24,
              title: 'Get Started',
              onPressed: () => context.go('/${AppRoutes.onboarding2}'),
            ),
          ),
        ),

        //text for login if already have an account
        Positioned(
          bottom: 35,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Already have an account?",
              children: [
                TextSpan(
                  text: " Login",
                  style: MyTextStyles.bodyLargeNormalWhite.apply(
                      decoration: TextDecoration.underline,
                      color: MyColors.orange,
                      fontWeightDelta: 2),
                ),
              ],
              style: MyTextStyles.bodyLargeNormalWhite,
            ),
          ),
        )
      ],
    ));
  }
}
