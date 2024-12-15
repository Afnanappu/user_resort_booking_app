import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/feature/authentication/views/components/custom_text_form_field_auth.dart';

class RegisterTextFormFields extends StatelessWidget {
  const RegisterTextFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: MyTextStyles.titleLargeSemiBoldBlack,
        ),
        CustomTextFormFieldAuth(
          keyboardType: TextInputType.name,
          prefixIcon: Icon(Icons.person_outline),
          hintText: 'name',
        ),
        MySpaces.hSpace10,
        Text(
          'Email',
          style: MyTextStyles.titleLargeSemiBoldBlack,
        ),
        CustomTextFormFieldAuth(
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(Icons.email_outlined),
          hintText: 'name@example.com',
        ),
        MySpaces.hSpace10,
        Text(
          'Password',
          style: MyTextStyles.titleLargeSemiBoldBlack,
        ),
        CustomTextFormFieldAuth(
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: Icon(Icons.password_outlined),
          hintText: 'password',
          suffixIcon: Icon(
            FontAwesomeIcons.eyeSlash,
            size: 18,
          ),
        ),
        MySpaces.hSpace10,
        Text(
          'Confirm Password',
          style: MyTextStyles.titleLargeSemiBoldBlack,
        ),
        CustomTextFormFieldAuth(
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: Icon(Icons.password_outlined),
          hintText: 'password',
          suffixIcon: Icon(
            FontAwesomeIcons.eyeSlash,
            size: 18,
          ),
        ),
      ],
    );
  }
}
