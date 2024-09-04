import 'dart:async';
import 'package:avir_app/core/storage/app_preference.dart';
import 'package:injectable/injectable.dart';


abstract class TokenRepository {
  String? getToken();


  Future<void> saveToken(String token);

  Future<void> deleteToken();
}

@Singleton(as: TokenRepository)
class TokenRepositoryImpl implements TokenRepository {
  TokenRepositoryImpl(this._preference);


  final AppPreference _preference;

  @override
  Future<void> deleteToken() async {
    await _preference.deleteToken();
  }

  // @override
  // Future<TokenEntity> refreshToken(TokenEntity tokenEntity) async {
  //   try {
  //
  //   } on DioException catch (error) {
  //   rethrow;
  //   }
  // }

  @override
  Future<void> saveToken(String token) async {
    await _preference.setRefreshToken(token);
    await _preference.setAccessToken(token);
  }

  @override
  String? getToken() => _preference.accessToken;
}
