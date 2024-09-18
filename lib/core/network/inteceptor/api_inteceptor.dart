import 'dart:async';
import 'dart:io';

import 'package:avir_app/features/auth/domain/repository/token_repository.dart';
import 'package:dio/dio.dart';


class CommonRequestInterceptor extends QueuedInterceptor {
  CommonRequestInterceptor(
    this._dio,
  );

  final Dio _dio;


  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
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
    try {
      if (_token?.isNotEmpty ?? false) {
        options.headers[HttpHeaders.authorizationHeader] = 'Bearer $_token';
      }
      return super.onRequest(options, handler);
    } on DioException catch (e) {
      handler.reject(e, true);
    } on Object catch (e) {
      rethrow;
    }
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
  return handler.next(err);
  }
}
