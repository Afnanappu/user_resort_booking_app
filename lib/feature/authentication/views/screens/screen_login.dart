import 'package:flutter/material.dart';
import 'package:user_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/feature/authentication/views/widgets/email_and_password_widget.dart';
import 'package:user_resort_booking_app/feature/authentication/views/widgets/sign_in_and_google_widget.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MyScreenSize.height - kToolbarHeight,
            width: MyScreenSize.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MySpaces.flex1,
                  Text(
                    'Sign in',
                    style: MyTextStyles.headlineSmallSemiBoldBlack,
                  ),
                  Text(
                    'HI Welcome! Continue to login',
                    style: MyTextStyles.bodySmallMediumGreyLight,
                  ),
                  MySpaces.hSpace60,

                  //email and password text form field
                  EmailAndPasswordWidget(),

                  MySpaces.hSpace60,

                  //buttons for sign in and google
                  SignInAndGoogleButtonWidget(),
                  MySpaces.flex2,
                ],
              ),
            ),
          ),
        ));
  }
}
