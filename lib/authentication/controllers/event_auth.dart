part of 'bloc_auth.dart';

sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  LoginEvent({required this.email, required this.password});
  final String email;
  final String password;
}

class RegisterEvent extends AuthEvent {
  RegisterEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.surname,
  });
  final String name;
  final String surname;
  final String email;
  final String password;
}

// TODO(Janek): When app gets bigger and account deletion proccess is introduced, move GetUserEvent to some sort of user management bloc
class GetUserEvent extends AuthEvent {
  GetUserEvent();
}

class LogoutEvent extends AuthEvent {
  LogoutEvent();
}

class AuthResetEvent extends AuthEvent {
  AuthResetEvent();
}
