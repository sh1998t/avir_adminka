import 'dart:async';
import 'dart:io';

import 'package:avir_app/features/auth/domain/repository/token_repository.dart';
import 'package:dio/dio.dart';


class CommonRequestInterceptor extends QueuedInterceptor {
  CommonRequestInterceptor(
    this._dio,
  );

  final Dio _dio;

  Map<String, String> get _baseHeaders => {
        'Content-Type': 'application/json',
      };

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    print(options.data);
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    handler.next(err);
  }
}

class AuthorizedRequestInterceptor extends CommonRequestInterceptor {
  AuthorizedRequestInterceptor(
    super.dio,
    this._tokenRepository,
  );

  final TokenRepository _tokenRepository;

  String? get _token => _tokenRepository.getToken();

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    print(options.data);
    try {
      if (_token?.isNotEmpty ?? false) {
        options.headers[HttpHeaders.authorizationHeader] = 'Bearer ${_token}';
      }
      return super.onRequest(options, handler);
    } on DioException catch (e) {
      handler.reject(e, true);
    } on Object catch (e) {
      print(e);
    }
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
  return handler.next(err);
  }
}
