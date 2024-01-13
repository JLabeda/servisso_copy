import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:servisso/authentication/interface/auth_interface.dart';
import 'package:servisso/authentication/models/servisso_user.dart';
import 'package:servisso/core/dio/dio_client.dart';
import 'package:servisso/core/servisso_exception.dart';

class AuthService implements AuthInterface {
  AuthService(this._dioClient);

  final DioClient _dioClient;
  @override
  Future<void> changePassword() {
    // TODO(Janek): implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAccount() {
    // TODO(Janek): implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<ServissoException, UserCredential>> createFirebaseAccount(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
      return const Left(ServissoException.auth());
    } catch (e) {
      log('Error: $e');
      return const Left(ServissoException.auth());
    }
  }

  @override
  Future<Either<ServissoException, ServissoUser>> createServissoAccount(
    ServissoUser user,
  ) async {
    try {
      final response = await _dioClient.dio.post(
        'users',
        data: {
          'id': user.id,
          'name': user.name,
          'surname': user.surname,
          'email': user.email,
          'vehicleIdList': user.vehicleIdList,
          'servicesIdList': user.servicesIdList,
        },
      );
      return Right(ServissoUser.fromJson(response.data));
    } catch (e) {
      log('Error: $e');
      return const Left(ServissoException.auth());
    }
  }

  @override
  Future<Either<ServissoException, Unit>> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return const Right(unit);
    } catch (e) {
      log('Error: $e');
      return const Left(ServissoException.auth());
    }
  }

  @override
  Future<Either<ServissoException, Unit>> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return const Right(unit);
    } catch (e) {
      log('Error: $e');
      return const Left(ServissoException.auth());
    }
  }
}
