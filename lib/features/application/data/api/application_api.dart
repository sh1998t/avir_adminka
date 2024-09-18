

import 'package:avir_app/core/constants/url_path.dart';
import 'package:avir_app/features/application/data/models/application_request.dart';
import 'package:avir_app/features/application/data/models/invoice_model.dart';
import 'package:avir_app/features/application/data/models/user_response.dart';
import 'package:avir_app/features/application/domain/entities/application_request.dart';
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
  Future<PersonModel> getUserInfo(@Queries() UserInfoRequestEntity request);
  
  @POST(UrlPath.createApplication)
  Future<InvoiceResponse> createApplication(@Body() ApplicationRequest request);
}