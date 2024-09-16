

import 'package:avir_app/features/application/data/models/user_response.dart';
import 'package:avir_app/features/application/domain/entities/application_request.dart';

abstract class ApplicationRepository{
  Future<PersonModel> getUserInfo(ApplicationRequestEntity request);
}