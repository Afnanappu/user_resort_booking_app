import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/utils/custom_regex.dart';
import 'package:user_resort_booking_app/feature/authentication/views/components/custom_text_form_field_auth.dart';

class LoginTextFormFields extends StatelessWidget {
  const LoginTextFormFields({
    super.key,
    required this.emailController,
    required this.passwordController,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

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
            'Email',
            style: MyTextStyles.titleLargeSemiBoldBlack,
          ),
          CustomTextFormFieldAuth(
            validator: (value) {
              if (MyRegex.emailValidation(value)) {
                return "Invalid email";
              }
              return null;
            },
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icon(Icons.email_outlined),
            hintText: 'name@example.com',
          ),
          MySpaces.hSpace20,
          Text(
            'Password',
            style: MyTextStyles.titleLargeSemiBoldBlack,
          ),
          CustomTextFormFieldAuth(
            validator: (value) {
              if (MyRegex.passwordValidation(value)) {
                return 'Invalid password';
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
          MySpaces.hSpace5,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: MyColors.orange,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: MyColors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
