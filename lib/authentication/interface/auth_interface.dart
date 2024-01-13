import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:servisso/authentication/models/servisso_user.dart';
import 'package:servisso/core/servisso_exception.dart';

abstract class AuthInterface {
  Future<Either<ServissoException, UserCredential>> createFirebaseAccount(
    String email,
    String password,
  );
  Future<Either<ServissoException, ServissoUser>> createServissoAccount(
    ServissoUser user,
  );
  Future<Either<ServissoException, Unit>> login({
    required String email,
    required String password,
  });
  Future<Either<ServissoException, Unit>> logout();
  Future<void> deleteAccount();
  Future<void> changePassword();
}
