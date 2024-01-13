import 'dart:async';

import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servisso/core/env.dart';

final _servissoBackendBaseUrl = Env.servissoBackendUrl;

class DioClientBloc extends Bloc<DioClientEvent, DioClient> {
  DioClientBloc() : super(DioClient()) {
    on<DioClientEventUpdateDioData>(_onUpdateDioData);
  }
  final _dioClient = DioClient();

  FutureOr<void> _onUpdateDioData(
    DioClientEventUpdateDioData event,
    Emitter emit,
  ) {
    _dioClient.dio.options.headers = {
      'user_id': event.newUserId,
      'authorization': event.newIdToken,
    };
    emit(_dioClient);
  }
}

sealed class DioClientEvent {}

class DioClientEventUpdateDioData extends DioClientEvent {
  DioClientEventUpdateDioData(this.newIdToken, this.newUserId);
  final String newIdToken;
  final String newUserId;
}

class DioClient {
  DioClient() {
    _dio.options = BaseOptions(
      baseUrl: _servissoBackendBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
  }

  final _dio = Dio();
  Dio get dio => _dio;
}
