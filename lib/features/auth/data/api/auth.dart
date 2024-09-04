
import 'package:avir_app/core/constants/url_path.dart';
import 'package:avir_app/features/auth/data/model/login_request.dart';
import 'package:avir_app/features/auth/data/model/login_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'auth.g.dart';

@RestApi()
@injectable
abstract class AuthApi{

  @factoryMethod
  factory AuthApi(@Named("UnauthorizedClient") Dio dio) = _AuthApi;
  @POST(UrlPath.login)
  Future<LoginResponse> login(@Body() LoginRequest request);

}