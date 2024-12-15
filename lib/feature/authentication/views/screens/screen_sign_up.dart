import 'package:flutter/material.dart';
import 'package:user_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/feature/authentication/views/widgets/register_button_widget.dart';
import 'package:user_resort_booking_app/feature/authentication/views/widgets/register_text_form_fields.dart';

class ScreenSignUp extends StatelessWidget {
  const ScreenSignUp({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // MySpaces.flex1,
                Text(
                  'Register',
                  style: MyTextStyles.headlineSmallSemiBoldBlack,
                ),
                Text(
                  'Create an account and use our services',
                  style: MyTextStyles.bodySmallMediumGreyLight,
                ),
                MySpaces.hSpace40,

                //Registration text form field:  name, email, password and confirm password
                RegisterTextFormFields(),

                MySpaces.hSpace40,

                //Register buttons
                RegisterButtonWidget(),
                // MySpaces.flex2,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
