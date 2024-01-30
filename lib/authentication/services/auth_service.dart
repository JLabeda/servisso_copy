import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:servisso/authentication/interface/auth_interface.dart';
import 'package:servisso/authentication/models/user.dart';
import 'package:servisso/core/dio/dio_client.dart';
import 'package:servisso/core/main.dart';
import 'package:servisso/core/servisso_exception.dart';

class AuthService implements AuthInterface {
  AuthService();

  late DioClient dioClient = getIt.get<DioClientBloc>().state;

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
  Future<Either<ServissoException, User>> createServissoAccount(
    User user,
  ) async {
    try {
      final response = await dioClient.dio.post(
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
      return Right(User.fromJson(response.data));
    } catch (e) {
      log('Error: $e');
      return const Left(ServissoException.auth());
    }
  }

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
  Future<Either<ServissoException, UserCredential>> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return Right(credential);
    } catch (e) {
      log('Error: $e');
      return const Left(ServissoException.auth());
    }
  }

  @override
  Future<Either<ServissoException, User>> getUser(String userId) async {
    try {
      final response = await dioClient.dio.get('users/$userId');
      return Right(User.fromJson(response.data as Map<String, dynamic>));
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
