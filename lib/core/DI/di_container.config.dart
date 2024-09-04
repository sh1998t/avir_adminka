// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:avir_app/core/DI/dio_module.dart' as _i393;
import 'package:avir_app/core/storage/app_preference.dart' as _i119;
import 'package:avir_app/core/storage/storage_module.dart' as _i895;
import 'package:avir_app/features/application/data/api/application_api.dart'
    as _i448;
import 'package:avir_app/features/application/data/repository/application_repository_implentation.dart'
    as _i991;
import 'package:avir_app/features/application/domain/repository/application_repository.dart'
    as _i686;
import 'package:avir_app/features/application/presentation/bloc/application_bloc.dart'
    as _i1043;
import 'package:avir_app/features/auth/data/api/auth.dart' as _i464;
import 'package:avir_app/features/auth/data/repository/auth_repository.dart'
    as _i424;
import 'package:avir_app/features/auth/domain/repository/auth_repository.dart'
    as _i468;
import 'package:avir_app/features/auth/domain/repository/token_repository.dart'
    as _i158;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    final dioModule = _$DioModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => storageModule.createSharedPreference(),
      preResolve: true,
    );
    gh.singleton<_i119.AppPreference>(
        () => _i119.AppPreference(gh<_i460.SharedPreferences>()));
    gh.factory<String>(
      () => dioModule.host,
      instanceName: 'Host',
    );
    gh.singleton<_i158.TokenRepository>(
        () => _i158.TokenRepositoryImpl(gh<_i119.AppPreference>()));
    gh.singletonAsync<_i361.Dio>(() => dioModule.getAuthorizedDioClient(
        tokenRepository: gh<_i158.TokenRepository>()));
    gh.singletonAsync<_i361.Dio>(
      () => dioModule.getUnauthorizedDioClient(
          host: gh<String>(instanceName: 'Host')),
      instanceName: 'UnauthorizedClient',
    );
    gh.factoryAsync<_i464.AuthApi>(() async => _i464.AuthApi(
        await getAsync<_i361.Dio>(instanceName: 'UnauthorizedClient')));
    gh.factoryAsync<_i448.ApplicationApi>(
        () async => _i448.ApplicationApi(await getAsync<_i361.Dio>()));
    gh.singletonAsync<_i686.ApplicationRepository>(() async =>
        _i991.ApplicationRepositoryImplementation(
            await getAsync<_i448.ApplicationApi>()));
    gh.factoryAsync<_i1043.ApplicationBloc>(() async =>
        _i1043.ApplicationBloc(await getAsync<_i686.ApplicationRepository>()));
    gh.singletonAsync<_i468.AuthRepository>(
        () async => _i424.AuthRepositoryImpl(
              await getAsync<_i464.AuthApi>(),
              gh<_i119.AppPreference>(),
            ));
    return this;
  }
}

class _$StorageModule extends _i895.StorageModule {}

class _$DioModule extends _i393.DioModule {}
