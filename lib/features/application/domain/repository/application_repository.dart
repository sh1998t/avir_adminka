

import 'package:avir_app/features/application/data/models/user_info_request.dart';
import 'package:avir_app/features/application/data/models/user_response.dart';

abstract class ApplicationRepository{
  Future<PersonModel> getUserInfo(UserInfoRequest request);
}