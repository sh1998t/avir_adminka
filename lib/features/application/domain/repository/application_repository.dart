

import 'package:avir_app/features/application/data/models/application_request.dart';
import 'package:avir_app/features/application/data/models/invoice_model.dart';
import 'package:avir_app/features/application/data/models/user_response.dart';
import 'package:avir_app/features/application/domain/entities/application_request.dart';

abstract class ApplicationRepository{
  Future<PersonModel> getUserInfo(UserInfoRequestEntity request);
  Future<InvoiceResponse> createResponse(ApplicationRequest request);
}