import 'package:flutter/material.dart';
import 'package:user_resort_booking_app/core/components/elevated_button_auth.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';

class SignInAndGoogleButtonWidget extends StatelessWidget {
  const SignInAndGoogleButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButtonAuthentication(
          title: 'Sign in',
          haveBg: true,
          onPressed: () {},
        ),
        MySpaces.hSpace20,
        Text(
          'Or Sign in with',
          style: MyTextStyles.bodySmallMediumGreyLight,
        ),
        MySpaces.hSpace20,
        Image.asset(
          'assets/google-icon.png',
          width: 35,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}
