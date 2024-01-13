part of 'bloc_auth.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool isLoading,
    required Option<Either<ServissoException, ServissoUser>>
        createAccountResult,
    required Option<Either<ServissoException, Unit>> loginResult,
    required Option<Either<ServissoException, Unit>> logoutResult,
  }) = _AuthState;

  factory AuthState.zero() => AuthState(
        isLoading: false,
        createAccountResult: none(),
        loginResult: none(),
        logoutResult: none(),
      );
}

extension AuthStateExt on AuthState {
  bool get isCreateAccountSuccess => createAccountResult.fold(
        () => false,
        (a) => a.fold((l) => false, (r) => true),
      );

  bool get isLogoutSuccess =>
      logoutResult.fold(() => false, (a) => a.fold((l) => false, (r) => true));

  bool get isLoginSuccess =>
      loginResult.fold(() => false, (a) => a.fold((l) => false, (r) => true));
}
