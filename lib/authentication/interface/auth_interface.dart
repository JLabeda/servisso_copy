import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:servisso/authentication/models/user.dart';
import 'package:servisso/core/servisso_exception.dart';

abstract class AuthInterface {
  Future<Either<ServissoException, UserCredential>> createFirebaseAccount(
    String email,
    String password,
  );
  Future<Either<ServissoException, User>> createServissoAccount(
    User user,
  );
  Future<Either<ServissoException, UserCredential>> login({
    required String email,
    required String password,
  });
  Future<Either<ServissoException, Unit>> logout();

  Future<Either<ServissoException, User>> getUser(String userId);

  Future<void> deleteAccount();
  Future<void> changePassword();
}
