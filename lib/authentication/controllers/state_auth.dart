part of 'bloc_auth.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool isLoading,
    required Option<Either<ServissoException, User>> userResult,
    required Option<Either<ServissoException, UserCredential>> loginResult,
    required Option<Either<ServissoException, Unit>> logoutResult,
  }) = _AuthState;

  factory AuthState.zero() => AuthState(
        isLoading: false,
        userResult: none(),
        loginResult: none(),
        logoutResult: none(),
      );
}

extension AuthStateExt on AuthState {
  bool get isUserValid => userResult.fold(
        () => false,
        (a) => a.fold((l) => false, (r) => true),
      );

  bool get isLogoutSuccess =>
      logoutResult.fold(() => false, (a) => a.fold((l) => false, (r) => true));

  bool get isLoginSuccess =>
      loginResult.fold(() => false, (a) => a.fold((l) => false, (r) => true));

  User? get user =>
      userResult.fold(() => null, (r) => r.fold((l) => null, (r) => r));

  UserCredential? get credential =>
      loginResult.fold(() => null, (r) => r.fold((l) => null, (r) => r));
}
