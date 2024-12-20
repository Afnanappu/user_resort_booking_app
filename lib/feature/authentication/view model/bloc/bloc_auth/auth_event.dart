part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.register(String name, String email, String password) =
      _Register;
  const factory AuthEvent.loginWithEmail(String email, String password) =
      _LoginWithEmail;
  const factory AuthEvent.loginWithGoogle() = _LoginWithGoogle;
}
