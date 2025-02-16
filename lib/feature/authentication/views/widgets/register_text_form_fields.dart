import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/utils/custom_regex.dart';
import 'package:user_resort_booking_app/feature/authentication/views/components/custom_text_form_field_auth.dart';

class RegisterTextFormFields extends StatelessWidget {
  const RegisterTextFormFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: MyTextStyles.titleLargeSemiBoldBlack,
          ),
          CustomTextFormFieldAuth(
            validator: (value) {
              if (MyRegex.nameValidation(value)) {
                return 'Name only contains letters';
              }
              return null;
            },
            controller: nameController,
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
            validator: (value) {
              if (MyRegex.emailValidation(value)) {
                return 'Invalid email';
              }
              return null;
            },
            controller: emailController,
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
            validator: (value) {
              if (MyRegex.passwordValidation(value)) {
                return 'password must contain at least 8 characters';
              }
              return null;
            },
            controller: passwordController,
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
            validator: (value) {
              if (MyRegex.passwordValidation(value)) {
                return 'password must contain at least 8 characters';
              }
              if (value?.trim() != passwordController.text.trim()) {
                return 'Password is not matched, try again';
              }
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Icon(Icons.password_outlined),
            hintText: 'password',
            suffixIcon: Icon(
              FontAwesomeIcons.eyeSlash,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
