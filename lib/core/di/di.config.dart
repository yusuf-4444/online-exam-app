// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/auth/api/client/auth_api_client.dart' as _i213;
import '../../features/auth/api/datasource/local/auth_local_data_source_impl.dart'
    as _i485;
import '../../features/auth/api/datasource/remote/auth_remote_data_source_impl.dart'
    as _i26;
import '../../features/auth/data/datasource/local/auth_local_data_source.dart'
    as _i201;
import '../../features/auth/data/datasource/remote/auth_remote_data_source.dart'
    as _i47;
import '../../features/auth/data/repo/auth_repo_impl.dart' as _i984;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/auth/domain/usecases/sign_in_usecase.dart' as _i259;
import '../../features/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart'
    as _i715;
import '../dio/dio_module.dart' as _i977;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.singleton<_i528.PrettyDioLogger>(() => dioModule.addInterceptors());
    gh.lazySingleton<_i201.AuthLocalDataSource>(
      () => _i485.AuthLocalDataSourceImpl(),
    );
    gh.singleton<_i213.AuthApiClient>(
      () => _i213.AuthApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i47.AuthRemoteDataSource>(
      () => _i26.AuthRemoteDataSourceImpl(gh<_i213.AuthApiClient>()),
    );
    gh.lazySingleton<_i170.AuthRepo>(
      () => _i984.AuthRepoImpl(
        remoteDataSource: gh<_i47.AuthRemoteDataSource>(),
        localDataSource: gh<_i201.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i259.SignInUsecase>(
      () => _i259.SignInUsecase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i715.SignInCubit>(
      () => _i715.SignInCubit(gh<_i259.SignInUsecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
