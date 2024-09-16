

import 'package:avir_app/features/application/data/api/application_api.dart';
import 'package:avir_app/features/application/data/models/user_info_request.dart';
import 'package:avir_app/features/application/data/models/user_response.dart';
import 'package:avir_app/features/application/domain/entities/application_request.dart';
import 'package:avir_app/features/application/domain/repository/application_repository.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: ApplicationRepository)
class ApplicationRepositoryImplementation extends ApplicationRepository{
final ApplicationApi _api;

  ApplicationRepositoryImplementation(this._api);
  @override
  Future<PersonModel> getUserInfo(ApplicationRequestEntity request) async => await _api.getUserInfo(request);

}