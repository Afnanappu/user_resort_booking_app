import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/feature/authentication/view%20model/bloc/bloc_auth/auth_bloc.dart';
import 'package:user_resort_booking_app/feature/authentication/views/widgets/register_button_widget.dart';
import 'package:user_resort_booking_app/feature/authentication/views/widgets/register_text_form_fields.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MyScreenSize.height - kToolbarHeight,
          width: MyScreenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                state.maybeWhen(
                  initial: () {
                    showCustomSnackBar(
                      context: context,
                      message: 'Registration completed successfully',
                      bgColor: MyColors.success,
                    );
                    context.go('/${AppRoutes.login}');
                  },
                  error: (message) {
                    showCustomSnackBar(context: context, message: message);
                  },
                  orElse: () {},
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MySpaces.flex1,
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
                  RegisterTextFormFields(
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: _formKey,
                  ),

                  MySpaces.hSpace40,

                  //Register buttons
                  RegisterButtonWidget(
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: _formKey,
                  ),
                  // MySpaces.flex2,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
