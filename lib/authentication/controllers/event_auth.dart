part of 'bloc_auth.dart';

sealed class AuthEvent {}

class AuthEventLogin extends AuthEvent {
  AuthEventLogin({required this.email, required this.password});
  final String email;
  final String password;
}

class AuthEventRegister extends AuthEvent {
  AuthEventRegister({
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

class AuthEventLogout extends AuthEvent {
  AuthEventLogout();
}

class AuthEventReset extends AuthEvent {
  AuthEventReset();
}
