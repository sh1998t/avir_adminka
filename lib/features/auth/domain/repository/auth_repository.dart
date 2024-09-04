

import 'package:avir_app/features/auth/data/model/login_request.dart';

abstract class AuthRepository{
  Future<void> login(LoginRequest request);
}