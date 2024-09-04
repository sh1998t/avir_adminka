import 'package:avir_app/core/DI/di_container.dart';
import 'package:avir_app/core/constants/app_constants.dart';
import 'package:avir_app/core/network/inteceptor/api_inteceptor.dart';
import 'package:avir_app/features/auth/domain/repository/token_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


const _requestTimeoutInMilliseconds = 30000;

@module
abstract class DioModule {
  @Named("Host")
  String get host => AppConstants.baseUrl;

  @singleton
  Future<Dio> getAuthorizedDioClient({
    required TokenRepository tokenRepository,
  }) async {
    final authorizedDioClient = _createDioClient(AppConstants.baseUrl);
    authorizedDioClient.interceptors.addAll([
      AuthorizedRequestInterceptor(
        authorizedDioClient,
        inject(),
      ),

    ]);
    return authorizedDioClient;
  }

  @Named("UnauthorizedClient")
  @singleton
  Future<Dio> getUnauthorizedDioClient({
    @Named("Host") required String host,
  }) async {
    final unauthorizedDioClient = _createDioClient(AppConstants.baseUrl);
    unauthorizedDioClient.interceptors.addAll([
      CommonRequestInterceptor(
        unauthorizedDioClient,
      ),
    ]);
    return unauthorizedDioClient;
  }

  Dio _createDioClient(
    String baseUrl, {
    int requestTimeoutInMilliseconds = _requestTimeoutInMilliseconds,
  }) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(milliseconds: requestTimeoutInMilliseconds),
      receiveTimeout: Duration(milliseconds: requestTimeoutInMilliseconds),
    );
    return Dio(options);
  }

}
