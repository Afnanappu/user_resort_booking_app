import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_resort_booking_app/core/data/models/user_model.dart';
import 'package:user_resort_booking_app/feature/authentication/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(_Initial()) {
    on<_Register>((event, emit) async {
      emit(AuthState.loading());

      try {
        //TODO: Look hear some time.
        await _authRepository.register(
          event.name,
          event.email,
          event.password,
        );
        emit(AuthState.initial());
      } catch (e) {
        emit(AuthState.error(e.toString()));
      }
    });

    on<_LoginWithEmail>((event, emit) async {
      emit(AuthState.loading());

      try {
        final user =
            await _authRepository.loginWithEmail(event.email, event.password);
        emit(AuthState.authenticated(user));
      } catch (e) {
        emit(AuthState.loginFailed(e.toString()));
      }
    });

    on<_LoginWithGoogle>(
      (event, emit) async {
        emit(AuthState.loading());
        try {
          final user = await _authRepository.loginWithGoogle();
          emit(AuthState.authenticated(user));
        } catch (e) {
          emit(AuthState.loginFailed(e.toString()));
        }
      },
    );
  }
}
