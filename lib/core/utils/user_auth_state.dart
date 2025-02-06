import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

///True if user is already login ie, [currentUser] != null otherwise false
bool userCurrentAuthState() {
  if (FirebaseAuth.instance.currentUser != null) {
    return true;
  }
  return false;
}

Future<void> logoutFromApp(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  if (await GoogleSignIn().isSignedIn()) {
    GoogleSignIn().signOut();
  }
  if (context.mounted) {
    context.go("/${AppRoutes.login}");
  }
}
