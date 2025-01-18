import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/constants/spaces.dart';
import 'package:user_resort_booking_app/core/constants/text_styles.dart';
import 'package:user_resort_booking_app/core/data/view_model/cubit/user_data_cubit.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/feature/authentication/view%20model/bloc/bloc_auth/auth_bloc.dart';
import 'package:user_resort_booking_app/feature/authentication/views/widgets/login_text_form_fields.dart';
import 'package:user_resort_booking_app/feature/authentication/views/widgets/login_and_google_buttons.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
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
                authenticated: (user) async {
                  context.read<UserDataCubit>().setUser(user);

                  showCustomSnackBar(
                    context: context,
                    message: 'Login completed successfully',
                    bgColor: MyColors.success,
                  );
                  context.go("/${AppRoutes.home}");
                },
                loginFailed: (message) {
                  showCustomSnackBar(
                    context: context,
                    message: message,
                  );
                },
                orElse: () {},
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MySpaces.flex2,
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
                LoginTextFormFields(
                  emailController: emailController,
                  passwordController: passwordController,
                  formKey: _formKey,
                ),

                MySpaces.hSpace60,

                //buttons for sign in and google
                SignInAndGoogleButtonWidget(
                  emailController: emailController,
                  passwordController: passwordController,
                  formKey: _formKey,
                ),
                // MySpaces.flex1,
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
