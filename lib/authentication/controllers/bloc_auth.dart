import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:servisso/authentication/models/user.dart';
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
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
    on<GetUserEvent>(_onGetUser);
    on<LogoutEvent>(_onLogout);
    on<AuthResetEvent>(_onReset);
  }

  final AuthService _service;

  /// First create firebase account, if successful - create Servisso account
  Future<void> _onRegister(RegisterEvent event, Emitter emit) async {
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
          User(
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
              userResult: some(Right(createAccountResponse.getRightOrThrow())),
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
        userResult: some(Left(exception)),
      ),
    );
    return;
  }

  Future<void> _onLogin(LoginEvent event, Emitter emit) async {
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

  Future<void> _onLogout(LogoutEvent event, Emitter emit) async {
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

  Future<void> _onGetUser(GetUserEvent event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.getUser(state.credential!.user!.uid);
    if (response.isRight()) {
      emit(
        state.copyWith(
          isLoading: false,
          userResult: some(Right(response.getRightOrThrow())),
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          userResult: some(Left(response.getLeftOrThrow())),
        ),
      );
    }
  }

  void _onReset(AuthResetEvent event, emit) => emit(AuthState.zero());
}
