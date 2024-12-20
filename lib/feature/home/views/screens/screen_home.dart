import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:user_resort_booking_app/core/data/providers/user_provider.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            if (await GoogleSignIn().isSignedIn()) {
              await GoogleSignIn().signOut();
            }
            context.go('/${AppRoutes.login}');
          },
          child: Consumer<UserProvider>(
            builder: (_, value, __) => Text(value.user.name),
          ),
        ),
      ),
    );
  }
}
