import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servisso/core/env.dart';

final _servissoBackendBaseUrl = Env.servissoBackendUrl;

/// Remember that [DioClient] used in services which fetch Backend data is always declared as late.
///
///  At this stage of project it is the easiest way to ensure latest userId & token passed in headers
class DioClientBloc extends Bloc<DioClientEvent, DioClient> {
  DioClientBloc() : super(DioClient()) {
    on<DioClientEventUpdateDioData>(_onUpdateDioData);
  }
  final _dioClient = DioClient();

  void _onUpdateDioData(
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
