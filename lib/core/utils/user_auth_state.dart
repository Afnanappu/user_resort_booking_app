import 'package:firebase_auth/firebase_auth.dart';

///True if user is already login ie, [currentUser] != null otherwise false
bool userCurrentAuthState() {
  if (FirebaseAuth.instance.currentUser != null) {
    return true;
  }
  return false;
}
