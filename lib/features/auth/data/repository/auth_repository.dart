


import 'package:avir_app/core/storage/app_preference.dart';
import 'package:avir_app/features/auth/data/api/auth.dart';
import 'package:avir_app/features/auth/data/model/login_request.dart';
import 'package:avir_app/features/auth/data/model/login_response.dart';
import 'package:avir_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository{
  final AuthApi _api;
  final AppPreference _preference;

  AuthRepositoryImpl(this._api, this._preference);
  @override
  Future<void> login(LoginRequest request) async {
  final LoginResponse response =  await _api.login(request);
  _preference.setAccessToken(response.accessToken);
  }

}