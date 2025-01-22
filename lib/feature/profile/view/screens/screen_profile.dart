import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (await GoogleSignIn().isSignedIn()) {
                GoogleSignIn().signOut();
              }
              if (context.mounted) {
                context.go("/${AppRoutes.login}");
              }
            },
            child: Text('Profile Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.push("/${AppRoutes.paymentHistory}");
            },
            child: Text('payment history screen'),
          ),
        ],
      ),
    );
  }
}
