

import 'package:avir_app/core/constants/url_path.dart';
import 'package:avir_app/features/application/data/models/user_info_request.dart';
import 'package:avir_app/features/application/data/models/user_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'application_api.g.dart';

@RestApi()
@injectable
abstract class ApplicationApi{
@FactoryMethod()
  factory ApplicationApi( Dio dio) = _ApplicationApi;

  @GET(UrlPath.getUserInfo)
  Future<PersonModel> getUserInfo(@Queries() UserInfoRequest request);
}