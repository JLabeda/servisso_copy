import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:servisso/authentication/models/servisso_user.dart';
import 'package:servisso/authentication/services/auth_service.dart';
import 'package:servisso/core/dartz_extension.dart';
import 'package:servisso/core/servisso_exception.dart';

part 'event_auth.dart';
part 'state_auth.dart';
part 'bloc_auth.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthService service,
  })  : _service = service,
        super(AuthState.zero()) {
    on<AuthEventRegister>(_onRegister);
    on<AuthEventLogin>(_onLogin);
    on<AuthEventLogout>(_onLogout);
    on<AuthEventReset>(_onReset);
  }

  final AuthService _service;

  FutureOr<void> _onRegister(AuthEventRegister event, emit) async {
    late ServissoException exception;
    emit(state.copyWith(isLoading: true));
    final firebaseResponse =
        await _service.createFirebaseAccount(event.email, event.password);
    if (firebaseResponse.isRight()) {
      final firebaseUser = firebaseResponse.getRightOrThrow();
      final userId = firebaseUser.user?.uid;
      final idToken = await firebaseUser.user?.getIdToken();
      if (userId is String && idToken is String) {
        final createAccountResponse = await _service.createServissoAccount(
          ServissoUser(
            name: event.name,
            surname: event.surname,
            email: event.email,
            id: userId,
          ),
        );
        if (createAccountResponse.isRight()) {
          emit(
            state.copyWith(
              isLoading: false,
              createAccountResult:
                  some(Right(createAccountResponse.getRightOrThrow())),
            ),
          );
          return;
        } else {
          exception = createAccountResponse.getLeftOrThrow();
        }
      } else {
        exception = const ServissoException.auth();
      }
    } else {
      exception = firebaseResponse.getLeftOrThrow();
    }
    emit(
      state.copyWith(
        isLoading: false,
        createAccountResult: some(Left(exception)),
      ),
    );
    return;
  }

  FutureOr<void> _onLogin(AuthEventLogin event, emit) async {
    emit(state.copyWith(isLoading: true));
    final response =
        await _service.login(email: event.email, password: event.password);
    if (response.isRight()) {
      emit(
        state.copyWith(
          isLoading: false,
          loginResult: some(Right(response.getRightOrThrow())),
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          loginResult: some(Left(response.getLeftOrThrow())),
        ),
      );
    }
  }

  Future<void> _onLogout(AuthEventLogout event, emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.logout();
    if (response.isRight()) {
      emit(
        state.copyWith(
          isLoading: false,
          logoutResult: some(Right(response.getRightOrThrow())),
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          logoutResult: some(Left(response.getLeftOrThrow())),
        ),
      );
    }
  }

  FutureOr<void> _onReset(AuthEventReset event, emit) => emit(AuthState.zero());
}
