

import 'package:avir_app/features/application/data/api/application_api.dart';
import 'package:avir_app/features/application/data/models/application_request.dart';
import 'package:avir_app/features/application/data/models/invoice_model.dart';
import 'package:avir_app/features/application/data/models/user_response.dart';
import 'package:avir_app/features/application/domain/entities/application_request.dart';
import 'package:avir_app/features/application/domain/repository/application_repository.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: ApplicationRepository)
class ApplicationRepositoryImplementation extends ApplicationRepository{
final ApplicationApi _api;

  ApplicationRepositoryImplementation(this._api);
  @override
  Future<PersonModel> getUserInfo(UserInfoRequestEntity request) async => await _api.getUserInfo(request);

  @override
  Future<InvoiceResponse> createResponse(ApplicationRequest request) async => await _api.createApplication(request);

}